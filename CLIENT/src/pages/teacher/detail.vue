<script setup>
import { useRoute } from 'vue-router'
import api from '@/plugins/utilites'
import { onMounted } from 'vue'
import constant from '@/constants'

const route = useRoute()

const teacher = ref({})

let getData = () => {
  console.table(route.query.id)
  if (route.query.id) {
    api.post(`teachers-show`, { id: route.query.id }).then(res => {
      teacher.value = res.data?.model
    })
  }
}
onMounted(() => {
  getData()
})

const positions = ref([
  {
    id: 1,
    name: "គ្រូបង្រៀន",
  },
  {
    id: 2,
    name: "នាយករង",
  },
  {
    id: 3,
    name: "នាយក",
  },
])
</script>

<template>
  <div>
    <!-- <h1>{{ route.query.id }}</h1>  -->
    <VCard>
      <VCardTitle> {{ $t('teacher_list') }} </VCardTitle>
    </VCard>
    <VCard class="mt-7">
      <VBtn
        class="mt-4 mx-5"
        color="secondary"
        variant="outlined"
        @click="$router.go(-1)"
      >
        <VIcon>mdi-arrow-back</VIcon>&nbsp;{{ $t('back') }}
      </VBtn>
      <VRow>
        <VCol
          col="12"
          md="3"
          class="mt-8 ml-12"
        >
          <VImg
            alt="student"
            :src="
              teacher?.photo_path != null
                ? constant.storagePath + teacher.photo_path
                : 'https://cdn.iconscout.com/icon/free/png-256/free-teacher-240-1128987.png'
            "
            width="70%"
          />
        </VCol>
        <VCol>
          <VCol>
            <VCardTitle class="bg-primary rounded">
              {{ $t('profile1') }}
            </VCardTitle>
          </VCol>
          <VRow>
            <VCol>
              <VCardText>{{ $t('code') }} : {{ teacher.code }}</VCardText>
              <VCardText>{{ $t('khmer_name') }} : {{ teacher.name }}</VCardText>
              <VCardText>{{ $t('latin_name') }} : {{ teacher.name_latin }}</VCardText>
              <VCardText>{{ $t('dob') }} : {{ teacher.dob }}</VCardText>
              <VCardText>{{ $t('headers.gender') }} : {{ teacher.sex_text }}</VCardText>
              <VCardText>
                {{ $t('Position') }} : {{
                  positions.find((position) => position.id === teacher.position)?.name
                }}
              </VCardText>
              <VCardText>{{ $t('pob') }} : {{ teacher.pob }}</VCardText>
              <VCardText>{{ $t('headers.phone_number') }} : {{ teacher.phone }}</VCardText>
            </VCol>
          </VRow>
        </VCol>
      </VRow>
    </VCard>
  </div>
</template>

<route lang="yaml">
meta:
  title: Detail Teacher
  layout: default
  subject: Auth
  active: 'teacher'
</route>
