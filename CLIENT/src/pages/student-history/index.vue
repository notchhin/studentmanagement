<script setup>
import api from '@/plugins/utilites'
import { onMounted, ref, watch } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'

const { t } = useI18n()
const currentPage = ref(1)
const headers = [
  'headers.id',
  'headers.name',
  'Sex',
  'village',
  'headers.phone_number',
  'headers.fatherName',
  'headers.motherName',
  'headers.status',
  
]

const data = ref([])
const numPages = ref(0)
const perPage = ref(10)
const router = useRouter()
const confirmDialog = ref(false)
const user_id = ref('')
const action = ref(null)
const loading = ref(false)
const total = ref(null)
const to = ref(null)
const from = ref(null)
const search = ref(null)
const selectedVillage = ref(null)
const register_at_from = ref(null)
const register_at_to = ref(null)
const villages = ref([]) // <-- was missing

const q = () => {
  fetchData()
}

const fetchData = () => {
  loading.value = true
  api
    .post('students-history-list', {
      perPage: perPage.value,
      page: currentPage.value,
      search: search.value,
      village: selectedVillage.value,
      register_at_from: register_at_from.value,
      register_at_to: register_at_to.value,
    })
    .then(res => {
      data.value = res.data?.data?.data
      total.value = res.data?.data?.total
      from.value = res.data?.data?.from
      to.value = res.data?.data?.to
      numPages.value = Math.ceil(res.data.data.total / perPage.value)

      if (res.data?.villages) {
        villages.value = [
          { id: null, name: t('All') },
          ...res.data.villages,
        ]
      }
    })
    .finally(() => {
      loading.value = false
    })
}

watch(currentPage, (newValue, oldValue) => {
  if (newValue) {
    fetchData()
  }
})

watch(selectedVillage, () => {
  currentPage.value = 1
  fetchData()
})

watch(register_at_from, () => {
  currentPage.value = 1
  fetchData()
})

watch(register_at_to, () => {
  currentPage.value = 1
  fetchData()
})

const edit = id => {
  router.push(`/student/${id}`)
}
const show = id => {
  router.push(`/student/detail?id=${id}`)
}

const onDelete = id => {
  action.value = 1
  user_id.value = id
  confirmDialog.value = true
}

const confirmAction = () => {
  api
    .post('students-delete', {
      id: user_id.value,
    })
    .then(res => {
      fetchData()
    })
    .finally(() => {
      confirmDialog.value = false
      user_id.value = ''
      action.value = null
    })
}

onMounted(() => {
  fetchData()
})
</script>

<template>
  <div>
    <VCard
      :title="$t('vcard.title3')"
      class="mb-5"
    >
      <VDivider />
      <VCardText>
        <VRow
          align="center"
          justify="start"
        >
          <VCol
            cols="12"
            md="4"
          >
            <VTextField
              v-model="search"
              :placeholder="$t('Search')"
              append-inner-icon="mdi-search"
              @keypress.enter="q"
              @click:append-inner="q"
              @update:modelValue="fetchData"
            />
          </VCol>

          <VCol
            cols="12"
            md="3"
          >
            <VSelect
              v-model="selectedVillage"
              :items="villages"
              item-title="name"
              item-value="id"
              :label="$t('village')"
            />
          </VCol>

          <VCol
            cols="12"
            md="3"
          >
            <VTextField
              v-model="register_at_from"
              :label="$t('from_date')"
              type="date"
            />
          </VCol>

          <VCol
            cols="12"
            md="3"
          >
            <VTextField
              v-model="register_at_to"
              :label="$t('to_date')"
              type="date"
            />
          </VCol>
        </VRow>
        <VTable
          :headers="headers"
          :items="data"
          item-key="fullName"
          class="table-rounded"
        >
          <thead>
            <tr>
              <th
                v-for="header in headers"
                :key="header"
              >
                {{ $t(header) }}
              </th>
            </tr>
          </thead>

          <tbody>
            <td
              v-if="loading"
              :colspan="headers.length"
            >
              <VProgressLinear
                indeterminate
                class="line"
              />
            </td>
            <tr v-if="loading && data.length === 0">
              <td
                :colspan="headers.length"
                class="text-center"
              >
                <div class="text-subtitle-2">
                  <p style="font-family: 'Battambang', Times, serif">
                    {{ $t('in progress') }}
                  </p>
                </div>
              </td>
            </tr>
            <tr v-if="!loading && data.length === 0">
              <td
                :colspan="headers.length"
                class="text-caption text-center"
                style="font-family: 'Battambang', Times, serif"
              >
                {{ $t('No data stored') }}
              </td>
            </tr>
            <tr
              v-for="row in data"
              :key="row.id"
              style="font-family: 'Battambang', Times, serif"
            >
              <td v-text="row.code" />
              <td v-text="row.last_name + ' ' + row.first_name" />
              <td v-text="row.sex_text" />
              <td v-text="row.village" />
              <td v-text="row.phone" />
              <td v-text="(row.d_last_name || '') + ' ' + (row.d_first_name || '')" />
              <td v-text="(row.m_last_name || '') + ' ' + (row.m_first_name || '')" />
              <td>
                <VChip
                  :color="row.deleted_at ? 'error' : row.status === 1 ? 'success' : 'warning'"
                  size="small"
                  label
                >
                  {{ row.deleted_at ? $t('Deleted') : (row.status === 1 ? $t('Active') : $t('Inactive')) }}
                </VChip>
              </td>
            </tr>
          </tbody>
        </VTable>
      </VCardText>
      <VCardActions>
        <VRow>
          <VCol
            cols="12"
            lg="6"
            md="12"
            sm="12"
            xs="12"
            class="mt-3 text-center"
          >
            <span v-if="!loading">{{ from }} - {{ to }} {{ total === 0 ? '' : `of ${total}` }}</span>
          </VCol>
          <VCol
            cols="12"
            lg="6"
            md="12"
            sm="12"
            xs="12"
          >
            <VPagination
              v-model="currentPage"
              class="ml-auto"
              :length="numPages"
              :total-visible="10"
            />
          </VCol>
        </VRow>
      </VCardActions>
    </VCard>

    <VDialog
      v-model="confirmDialog"
      style="max-width: 500px"
      persistent
    >
      <VCard>
        <VCardText> {{ $t('delete_student') }} </VCardText>
        <VCardActions class="ml-auto">
          <VBtn
            color="error"
            @click="confirmDialog = false"
          >
            {{ $t('no') }}
          </VBtn>
          <VBtn
            color="success"
            @click="confirmAction"
          >
            {{ $t('yes') }}
          </VBtn>
        </VCardActions>
      </VCard>
    </VDialog>
  </div>
</template>

<style>
.menu-container {
  position: relative;
}

.menu-container .v-menu__content {
  transform-origin: right top !important;
  left: auto !important;
  right: 100% !important;
}

.menu-list .menu-item {
  display: flex;
  align-items: center;
}

.menu-list .v-icon {
  margin-right: 10px;
}
</style>

<route lang="yaml">
name: students-history
path: /students-history-list
meta:
  title: Student History
  layout: default
  subject: Auth
  active: 'studentshistory'
</route>
