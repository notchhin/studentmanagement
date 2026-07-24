<script setup>
import { onMounted, reactive, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import api from '@/plugins/utilites'
const { params } = useRoute()
const params_id = ref(null)
const params_month = ref(null)
const params_s = ref(null)
const router = useRouter()
const route = useRoute()
const is_fetch = ref(false)
const model = ref({})
const exam_month = ref({})
const form = reactive({
  academic_class_id: params_id.value,
  type: params_month.value,
  semester: params_s.value || 1,
  exams: [
    {
      id: null,
      student_id: null,
      name: null,
      sex: null,
      m_att: 0,
      m_quiz: 0,
      m_hw: 0,
      m_pp: 0,
      m_pc: 0,

      m_t_mid: 0,
      total: 0,
      avg: 0,
    },
  ],
})
const submitting = ref(false)
const refForm = ref()

const fetchData = () => {
  api
    .post('academic-classes-detail', {
      id: route.query.id,
    })
    .then(res => {
      model.value = res.data.model
      is_fetch.value = true
    })
  fetchForm()
}

const fetchForm = () => {
  api
    .post('exam-form', {
      academic_class_id: route.query.id,
    })
    .then(res => {
      Object.assign(form.exams, res.data.form)
    })
}

const submit = async () => {
  const { valid } = await refForm.value?.validate()
  if (valid) {
    submitting.value = true
    api
      .post('exam-save', form)
      .then(res => {
        fetchForm()
      })
      .finally(() => {
        submitting.value = false
      })
  }
}

watch(
  () => form.semester,
  (newValue, oldValue) => {
    if (newValue != oldValue) {
      if (is_fetch.value) {
        if (form.type == 0) {
          fetchData()
        }
      }
    }
  },
)

onMounted(() => {
  form.academic_class_id = route.query.id
  fetchData()
})
</script>

<template>
  <div>
    <VRow>
      <VCol
        cols="12"
        md="12"
        sm="12"
      >
        <VForm
          ref="refForm"
          lazy-validation
          @submit.prevent="submit"
        >
          <VCard :title="`${$t('class')} ${model.level?.level} ${$t('academic_year')} ${model.academic_year?.name}`">
            <VDivider />
            <VBtn
              class="mt-5 mx-5"
              color="secondary"
              variant="outlined"
              @click="$router.go(-1)"
            >
              <VIcon>mdi-arrow-back</VIcon>&nbsp;{{ $t('back') }}
            </VBtn>
            <VCardText>
              <VRow>
                <VCol
                  cols="12"
                  md="4"
                  lg="4"
                  sm="12"
                >
                  <div class="text-h6 font-weight-bold">
                    <p style="font-family: 'Siemreap', Times, serif">
                      {{ $t('computer_score') }}
                    </p>
                  </div>
                  <div
                    class="text-h6 font-weight-bold"
                    style="line-height: 40px"
                  >
                    <p style="font-family: 'Siemreap', Times, serif">
                      {{ $t('teacher') }} : {{ model.teacher?.name }}
                    </p>
                  </div>

                  <div class="text-h6 font-weight-bold">
                    <p style="font-family: 'Siemreap', Times, serif">
                      {{ $t('room') }}: {{ model.room?.room }} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ $t('time') }}:
                      {{ model.time?.time }}
                    </p>
                  </div>
                </VCol>
                <VCol
                  cols="12"
                  md="2"
                  lg="2"
                  sm="12"
                  class="py-0"
                />
                <VCol
                  cols="10"
                  md="4"
                  lg="4"
                  sm="10"
                />
                <VCol
                  cols="2"
                  md="2"
                  lg="2"
                  sm="2"
                  class="mt-1"
                  align="end"
                >
                  <VBtn
                    color="success"
                    type="submit"
                    :loading="submitting"
                  >
                    <VIcon>mdi-content-save</VIcon> {{ $t('Save changes') }}
                  </VBtn>
                </VCol>
              </VRow>
              <table
                style="width: 90%; font-family: 'Siemreap', Times, serif"
                class="mt-5"
              >
                <thead>
                  <tr>
                    <th
                      rowspan="2"
                      colspan="1"
                    >
                      ល.រ
                    </th>
                    <th
                      rowspan="2"
                      colspan="4"
                    >
                      ឈ្មោះ
                    </th>
                    <th
                      rowspan="1"
                      colspan="1"
                    >
                      ភេទ
                    </th>
                    <th>ATT(5)</th>
                    <th>HW(10%)</th>
                    <th>Quiz(15%)</th>
                    <th>PP(35%)</th>
                    <th>PC(35%)</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(exam, index) in form.exams"
                    :key="index"
                  >
                    <td class="text-center">
                      {{ index + 1 }}
                    </td>
                    <td colspan="4">
                      {{ exam.last_name }} {{ exam.first_name }}
                    </td>
                    <td class="text-center">
                      {{ exam.gender == 1 ? 'ប្រុស' : 'ស្រី' }}
                    </td>
                    <td class="text-center">
                      <VTextField
                        v-model="exam.m_att"
                        class="cus"
                        variant="plain"
                        density="compact"
                        :rules="[v => v <= 5 || 'ពិន្ទុអតិបរមា៥']"
                      />
                    </td>
                    <td>
                      <VTextField
                        v-model="exam.m_hw"
                        class="cus"
                        variant="plain"
                        density="compact"
                        :rules="[v => v <= 10 || 'ពិន្ទុអតិបរមា១០']"
                      />
                    </td>
                    <td>
                      <VTextField
                        v-model="exam.m_quiz"
                        class="cus"
                        variant="plain"
                        density="compact"
                        :rules="[v => v <= 15 || 'ពិន្ទុអតិបរមា១៥']"
                      />
                    </td>
                    <td>
                      <VTextField
                        v-model="exam.m_pp"
                        class="cus"
                        variant="plain"
                        density="compact"
                        :rules="[v => v <= 35 || 'ពិន្ទុអតិបរមា៣៥']"
                      />
                    </td>
                    <td>
                      <VTextField
                        v-model="exam.m_pc"
                        class="cus"
                        variant="plain"
                        density="compact"
                        :rules="[v => v <= 35 || 'ពិន្ទុអតិបរមា៣៥']"
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
            </VCardText>
          </VCard>
        </VForm>
      </VCol>
    </VRow>
  </div>
</template>

<route lang="yaml">
meta:
  title: Score
  layout: default
  subject: Auth
  active: 'academic-class'
</route>

<style scoped>
table {
  border-collapse: collapse;
}
table,
th,
td {
  border: 1px solid black;
  padding: 5px;
}
.cus >>> input {
  text-align: center;
}
</style>
