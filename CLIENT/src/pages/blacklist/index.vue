<script setup>
import api from '@/plugins/utilites'
import { onMounted, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRouter } from 'vue-router'

const currentPage = ref(1)
const headers = [
  'headers.id',
  'headers.name',
  'headers.phone_number',
  'Reason',
  'From Date',
  'To Date',
  'Time Remaining',
  'headers.action',
]

const data = ref([])
const numPages = ref(0)
const perPage = ref(10)
const router = useRouter()
const { t } = useI18n()
const confirmDialog = ref(false)
const user_id = ref('')
const action = ref(null)
const loading = ref(false)
const total = ref(null)
const to = ref(null)
const from = ref(null)
const search = ref(null)

const q = () => {
  fetchData()
}

const fetchData = () => {
  loading.value = true
  api
    .post('blacklist-list', {
      perPage: perPage.value,
      page: currentPage.value,
      search: search.value,
    })
    .then(res => {
      data.value = res.data?.data?.data
      total.value = res.data?.data?.total
      from.value = res.data?.data?.from
      to.value = res.data?.data?.to
      numPages.value = Math.ceil(res.data.data.total / perPage.value)
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

const edit = blacklistId => {
  if (blacklistId) router.push(`/blacklist/${blacklistId}`)
}
const show = studentId => {
  if (studentId) router.push(`/student/detail?id=${studentId}`)
}

const onDelete = id => {
  action.value = 1
  user_id.value = id
  confirmDialog.value = true
}

const confirmAction = () => {
  api
    .post('blacklist-delete', {
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

const daysRemaining = row => {
  if (!row?.to_date) return ''

  const today = new Date()
  const toDate = new Date(row.to_date)

  if (Number.isNaN(toDate.getTime())) return ''

  const diffMs = toDate.setHours(0, 0, 0, 0) - today.setHours(0, 0, 0, 0)
  const days = Math.ceil(diffMs / (1000 * 60 * 60 * 24))

  if (days <= 0) return `0 ${t('days')}`
  if (days <= 31) return `${days} ${days === 1 ? t('day') : t('days')}`

  const months = Math.floor(days / 30)
  const remainingDays = days % 30
  const monthLabel = months === 1 ? t('month') : t('months')
  const dayLabel = remainingDays === 1 ? t('day') : t('days')

  return remainingDays > 0
    ? `${months} ${monthLabel} ${remainingDays} ${dayLabel}`
    : `${months} ${monthLabel}`
}

onMounted(() => {
  fetchData()
})
</script>

<template>
  <div>
    <VCard
      :title="$t('blacklist')"
      class="mb-5"
    >
      <VDivider />
      <VCardText>
        <VRow justify="start">
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
            md="4"
          ></VCol>
          <VCol
            cols="6"
            md="4"
            class="text-end"
          >
            <VBtn
              size="large"
              variant="elevated"
              prepend-icon="mdi-plus"
              color="info"
              to="blacklist/create"
            >
              {{ $t('add new') }}
            </VBtn>
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
              ></VProgressLinear>
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
              <td v-text="row.student?.code || ''" />
              <td v-text="(row.student?.last_name || '') + ' ' + (row.student?.first_name || '')" />
              <td v-text="row.student?.phone || ''" />
              <td v-text="row.reason || ''" />
              <td v-text="row.from_date || ''" />
              <td v-text="row.to_date || ''" />
              <td v-text="daysRemaining(row)" />

              <td>
                <div class="menu-container">
                  <VMenu
                    open-on-hover
                    location="start"
                  >
                    <template #activator="{ props }">
                      <VBtn
                        class="menu-btn"
                        color="primary"
                        v-bind="props"
                        icon="mdi-dots-vertical"
                        variant="plain"
                      >
                      </VBtn>
                    </template>
                    <VList class="menu-list">
                      <VListItem @click="show(row.student?.id)">
                        <VListItemContent class="menu-item">
                          <VIcon color="grey">mdi-eye</VIcon>
                          <VListItemTitle>{{ $t('detail') }}</VListItemTitle>
                        </VListItemContent>
                      </VListItem>

                      <VListItem @click="edit(row.id)">
                        <VListItemContent class="menu-item">
                          <VIcon color="success">mdi-square-edit-outline</VIcon>
                          <VListItemTitle>{{ $t('edit') }}</VListItemTitle>
                        </VListItemContent>
                      </VListItem>

                      <VListItem @click="onDelete(row.id)">
                        <VListItemContent class="menu-item">
                          <VIcon color="error">mdi-minus-circle</VIcon>
                          <VListItemTitle>{{ $t('delete') }}</VListItemTitle>
                        </VListItemContent>
                      </VListItem>
                    </VList>
                  </VMenu>
                </div>
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
            >{{ $t('no') }}</VBtn
          >
          <VBtn
            color="success"
            @click="confirmAction"
            >{{ $t('yes') }}</VBtn
          >
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
meta:
  title: Blacklist
  layout: default
  subject: Auth
  active: 'blacklist'
</route>
