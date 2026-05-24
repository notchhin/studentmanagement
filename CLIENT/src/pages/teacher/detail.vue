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
</script>
<template>
  <div>
    <!-- <h1>{{ route.query.id }}</h1>  -->
    <v-card>
      <v-card-title> {{ $t('teacher_list') }} </v-card-title>
    </v-card>
    <v-card class="mt-7">
      <v-btn
        class="mt-4 mx-5"
        color="secondary"
        variant="outlined"
        @click="$router.go(-1)"
        ><v-icon>mdi-arrow-back</v-icon>&nbsp;{{ $t('back') }}</v-btn
      >
      <v-row>
        <v-col
          col="12"
          md="3"
          class="mt-8 ml-12"
        >
          <v-img
            alt="student"
            :src="
              teacher?.photo_path != null
                ? constant.storagePath + teacher.photo_path
                : 'https://cdn.iconscout.com/icon/free/png-256/free-teacher-240-1128987.png'
            "
            width="70%"
          >
          </v-img>
        </v-col>
        <v-col>
          <v-col>
            <v-card-title class="bg-primary rounded"> {{ $t('profile1') }} </v-card-title>
          </v-col>
          <v-row>
            <v-col>
              <v-card-text>{{ $t('code') }} : {{ teacher.code }}</v-card-text>
              <v-card-text>{{ $t('khmer_name') }} : {{ teacher.name }}</v-card-text>
              <v-card-text>{{ $t('latin_name') }} : {{ teacher.name_latin }}</v-card-text>
              <v-card-text>{{ $t('dob') }} : {{ teacher.dob }}</v-card-text>
              <v-card-text>{{ $t('headers.gender') }} : {{ teacher.sex_text }}</v-card-text>
              <v-card-text>{{ $t('Position') }} : {{ teacher.position }}</v-card-text>
              <v-card-text>{{ $t('pob') }} : {{ teacher.pob }}</v-card-text>
              <v-card-text>{{ $t('headers.phone_number') }} : {{ teacher.phone }}</v-card-text>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-card>
  </div>
</template>
<route lang="yaml">
meta:
  title: Detail Teacher
  layout: default
  subject: Auth
  active: 'teacher'
</route>
