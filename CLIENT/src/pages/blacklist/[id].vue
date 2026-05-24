<script setup>
import { onMounted, ref, watch } from 'vue'
import api from '@/plugins/utilites'
import { useRoute, useRouter } from 'vue-router'

const router = useRouter()
const route = useRoute()
const refForm = ref(null)
const submitting = ref(false)
const students = ref([])
const studentSearch = ref(null)

const form = {
  id: route.params.id,
  student_id: null,
  reason: null,
  from_date: null,
  to_date: null,
}

const formDataLocal = ref(structuredClone(form))

const fetchStudents = () => {
  api
    .post('students-list', {
      perPage: 1000,
      page: 1,
      search: studentSearch.value,
    })
    .then(res => {
      const items = res.data?.data?.data || []
      students.value = items.map(student => ({
        id: student.id,
        name: `${student.code || ''} ${student.last_name || ''} ${student.first_name || ''}`.trim(),
      }))
    })
}

const fetchBlacklist = () => {
  if (!route.params.id) return

  api.post('blacklist-show', { id: route.params.id }).then(res => {
    Object.assign(formDataLocal.value, res.data?.model)
  })
}

watch(studentSearch, () => {
  fetchStudents()
})

const submitHandler = async () => {
  const { valid } = await refForm.value?.validate()
  if (valid) {
    submitting.value = true

    api
      .post('blacklist-update', {
        id: formDataLocal.value.id,
        student_id: formDataLocal.value.student_id,
        reason: formDataLocal.value.reason,
        from_date: formDataLocal.value.from_date,
        to_date: formDataLocal.value.to_date,
      })
      .then(() => {
        router.push('/blacklist')
      })
      .finally(() => {
        submitting.value = false
      })
  }
}

onMounted(() => {
  fetchStudents()
  fetchBlacklist()
})
</script>

<template>
  <VRow>
    <VCol cols="12">
      <VCard :title="$t('blacklist')">
        <VCardText>
          <VBtn
            class="mb-4"
            color="primary"
            variant="outlined"
            @click="$router.go(-1)"
          >
            <VIcon>mdi-arrow-back</VIcon>&nbsp;{{ $t('back') }}
          </VBtn>

          <VForm
            ref="refForm"
            class="my-4 mx-3"
            lazy-validation
            @submit.prevent="submitHandler"
          >
            <VRow>
              <VCol
                cols="12"
                md="6"
              >
                <VAutocomplete
                  v-model="formDataLocal.student_id"
                  v-model:search="studentSearch"
                  :items="students"
                  item-title="name"
                  item-value="id"
                  :label="$t('students')"
                  :rules="[v => !!v || $t('required')]"
                  clearable
                />
              </VCol>

              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="formDataLocal.reason"
                  :label="$t('Reason')"
                />
              </VCol>

              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="formDataLocal.from_date"
                  type="date"
                  :label="$t('From Date')"
                />
              </VCol>

              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="formDataLocal.to_date"
                  type="date"
                  :label="$t('To Date')"
                />
              </VCol>

              <VCol cols="12">
                <VBtn
                  color="success"
                  type="submit"
                  :loading="submitting"
                >
                  {{ $t('Save changes') }}
                </VBtn>
              </VCol>
            </VRow>
          </VForm>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>
</template>

<route lang="yaml">
meta:
  title: Blacklist
  layout: default
  subject: Auth
  active: 'blacklist'
</route>
