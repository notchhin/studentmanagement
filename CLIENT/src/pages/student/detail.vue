<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import api from '@/plugins/utilites'
import moment from 'moment'
import constant from '@/constants'

const route = useRoute()

const student = ref({})
const academicClasses = ref([])
const blacklistHistory = ref([])
const family_status = ref([
  { id: 1, name: 'ក្រីក្រ' },
  { id: 2, name: 'ក្រីក្រ​ខ្លាំង' },
  { id: 3, name: 'ក្រីក្រមធ្យម' },
  { id: 4, name: 'មធ្យម' },
])

const familyStatusId = computed(() => {
  const rawValue = student.value.family_status ?? student.value.familyStatus
  const parsed = Number(rawValue)

  return Number.isNaN(parsed) ? null : parsed
})

const familyStatusLabel = computed(() => {
  if (familyStatusId.value !== null) {
    return family_status.value.find(item => item.id === familyStatusId.value)?.name || ''
  }

  return student.value.family_status ?? student.value.familyStatus ?? ''
})

const familyPhotoUrl = computed(() => {
  const raw =
    student.value.family_photo_path ??
    student.value.familyPhotoPath ??
    student.value.family_image ??
    student.value.familyImage
  const value = Array.isArray(raw) ? raw[0] : raw
  if (!value) return null
  if (typeof value !== 'string') return null

  return value.startsWith('http') ? value : `${constant.storagePath}${value}`
})

const getData = () => {
  if (route.query.id) {
    api
      .post('academic-classes-list-study-history', { student_id: route.query.id })
      .then(res => {
        if (res.data.status === 200) {
          student.value = res.data.student
          console.log('student', student.value)
          academicClasses.value = res.data.academic_classes
        } else {
          console.error(res.data.message)
        }
      })
      .catch(error => {
        console.error(error)
      })

    api
      .post('blacklist-list', { student_id: route.query.id, perPage: 1000, page: 1 })
      .then(res => {
        blacklistHistory.value = res.data?.data?.data || []
      })
      .catch(error => {
        console.error(error)
      })
  }
}

const formatDate = date => {
  return moment(date).format('D-MMM-YYYY')
}

onMounted(() => {
  getData()
})
</script>

<template>
  <div>
    <VCard>
      <VCardTitle>{{ $t('student_list') }}</VCardTitle>
    </VCard>

    <VCard class="mt-7">
      <VBtn
        class="mt-4 mx-5"
        color="primary"
        variant="outlined"
        @click="$router.go(-1)"
      >
        <VIcon>mdi-arrow-back</VIcon>&nbsp;{{ $t('back') }}
      </VBtn>
      <VDivider class="mt-4" />
      <div>
        <VRow class="mt-1">
          <VCol
            cols="12"
            md="3"
          >
            <h3 class="mb-3 mx-3">
              {{ $t('profile') }}
            </h3>
            <VCard class="pa-2">
              <VCol
                cols="12"
                class="d-flex justify-center align-center"
              >
                <VImg
                  alt="student"
                  :src="
                    student?.photo_path != null
                      ? constant.storagePath + student.photo_path
                      : 'https://cdn-icons-png.flaticon.com/512/1154/1154987.png'
                  "
                />
              </VCol>

              <VChip
                class="mx-4"
                color="primary"
              >
                {{ $t('profile') }}
              </VChip>
              <VCardText>{{ $t('code') }} : {{ student.code }}</VCardText>
              <VCardText>{{ $t('headers.name') }} : {{ student.last_name + ' ' + student.first_name }}</VCardText>
              <VCardText>{{ $t('dob') }} : {{ formatDate(student.dob) }}</VCardText>
              <VCardText>{{ $t('headers.gender') }} : {{ student.sex_text }}</VCardText>
              <VCardText> {{ $t('family_status') }} : {{ familyStatusLabel }} </VCardText>

              <VCardText>
                {{ $t('status') }} :
                <VChip
                  :color="student.status === 1 ? 'success' : student.status === 2 ? 'warning' : 'error'"
                  size="small"
                  label
                >
                  {{ student.status === 1 ? $t('active') : student.status === 2 ? $t('blacklist') : $t('inactive') }}
                </VChip>
              </VCardText>
              <VCardText>{{ $t('from') }} : {{ student.from }}</VCardText>
              <VCardText>{{ $t('headers.phone_number') }} : {{ student.phone }}</VCardText>
              <VCardText>{{ $t('Register') }} : {{ student.created_at?.split('T')[0] }}</VCardText>
              <VCardText>{{ $t('other') }} : {{ student.other }}</VCardText>
              <VCardText>{{ $t('father_name') }} : {{ student.d_last_name }} {{ student.d_first_name }}</VCardText>
              <VCardText>{{ $t('father_job') }} : {{ student.d_job }}</VCardText>
              <VCardText>{{ $t('father_phone') }} : {{ student.d_phone_number }}</VCardText>
              <VCardText>{{ $t('mother_name') }} : {{ student.m_first_name }} {{ student.m_last_name }}</VCardText>
              <VCardText>{{ $t('mother_job') }} : {{ student.m_job }}</VCardText>
              <VCardText>{{ $t('mother_phone') }} : {{ student.m_phone_number }}</VCardText>
              <VCardText>{{ $t('guardian_name') }} : {{ student.g_first_name }} {{ student.g_last_name }}</VCardText>
              <VCardText>{{ $t('guardian_job') }} : {{ student.g_job }}</VCardText>
              <VCardText>{{ $t('guardian_phone') }} : {{ student.g_phone_number }}</VCardText>
            </VCard>
          </VCol>
          <VCol
            cols="12"
            md="9"
          >
            <h3 class="mx-3">
              {{ $t('family_information') }}
            </h3>

            <VCardText
              v-if="familyPhotoUrl"
              class="pb-4"
            >
              <VImg
                :src="familyPhotoUrl"
                alt="Family image"
                class="mt-2 rounded"
                max-height="500"
                width="100%"
                style="object-fit: contain; background-color: rgb(var(--v-theme-surface-variant), 0.3)"
              >
                <template #placeholder>
                  <VRow
                    class="fill-height ma-0"
                    align="center"
                    justify="center"
                  >
                    <VProgressCircular
                      indeterminate
                      color="primary"
                    />
                  </VRow>
                </template>
              </VImg>
            </VCardText>

            <h3 class="mb-3 mx-3">
              {{ $t('study_history') }}
            </h3>

            <div
              v-if="academicClasses.length === 0"
              class="mb-3"
            >
              <VCard class="pa-2">
                <VCardText class="text-center">
                  {{ $t('No data stored') }}
                </VCardText>
              </VCard>
            </div>
            <div
              v-for="(academicClass, index) in academicClasses"
              :key="index"
              class="mb-3"
            >
              <VCard class="pa-2">
                <VCardText>
                  <VCardTitle style="font-size: 15px">
                    {{ $t('academic_year') }}: {{ academicClass.academic_year?.name }}
                  </VCardTitle>
                  <div class="col">
                    <VCardTitle style="font-size: 15px">
                      {{ $t('room') }}: {{ academicClass.room?.room }}
                    </VCardTitle>
                  </div>
                  <div class="col">
                    <VCardTitle style="font-size: 15px">
                      {{ $t('time') }}: {{ academicClass.time?.time }}
                    </VCardTitle>
                  </div>
                  <div class="col">
                    <VCardTitle style="font-size: 15px">
                      {{ $t('type') }}:
                      {{ academicClass.type == 3 ? 'កុំព្យូទ័រ' : 'អង់គ្លេស' }}
                    </VCardTitle>
                  </div>

                  <div class="col">
                    <VCardTitle style="font-size: 15px">
                      {{ $t('teacher') }}: {{ academicClass.teacher?.name }}
                    </VCardTitle>
                  </div>
                </VCardText>
              </VCard>
            </div>

            <h3 class="mb-3 mx-3">
              {{ $t('blacklist_history') }}
            </h3>
            <VCard class="pa-2 mb-5">
              <VTable>
                <thead>
                  <tr>
                    <th>{{ $t('Reason') }}</th>
                    <th>{{ $t('From Date') }}</th>
                    <th>{{ $t('To Date') }}</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-if="blacklistHistory.length === 0">
                    <td
                      colspan="3"
                      class="text-center"
                    >
                      {{ $t('No data stored') }}
                    </td>
                  </tr>
                  <tr
                    v-for="item in blacklistHistory"
                    :key="item.id"
                  >
                    <td>{{ item.reason || '' }}</td>
                    <td>{{ item.from_date ? formatDate(item.from_date) : '' }}</td>
                    <td>{{ item.to_date ? formatDate(item.to_date) : '' }}</td>
                  </tr>
                </tbody>
              </VTable>
            </VCard>
          </VCol>
        </VRow>
      </div>
    </VCard>
  </div>
</template>

<route lang="yaml">
meta:
  title: Detail Student
  layout: default
  subject: Auth
  active: 'student'
</route>
