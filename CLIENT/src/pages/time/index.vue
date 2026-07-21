<script setup>
import api from '@/plugins/utilites'
import { computed, onMounted, reactive, ref, watch } from 'vue'
import _ from 'lodash'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/plugins/auth.module'
const currentPage = ref(1)
const headers = ['time', 'headers.action']

const form = reactive({
  filter: null,
})

const data = ref([])
const hi = ref()
const numPages = ref(0)
const perPage = ref(10)
const router = useRouter()
const confirmDialog = ref(false)
const role_id = ref('')
const loading = ref(false)
const total = ref(null)
const to = ref(null)
const from = ref(null)
const search = ref(null)
const user = useAuthStore().user

const canCreateTime = computed(() => {
  return ['create time', 'create times', 'time_create', 'times_create'].some(permission => user.can(permission))
})

const canEditTime = computed(() => {
  return ['edit time', 'edit times', 'time_edit', 'times_edit'].some(permission => user.can(permission))
})
const canDeleteTime = computed(() => {
  return ['delete time', 'delete times', 'time_delete', 'times_delete'].some(permission => user.can(permission))
})
const q = () => {
  fetchData()
}

const fetchData = () => {
  loading.value = true
  api
    .post(`time-list`, {
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
const onDelete = id => {
  confirmDialog.value = true
  role_id.value = id
}


const confirmDelete = () => {
  if (!role_id.value) return

  api
    .post('time -delete', {
      id: role_id.value,
    })
    .then(() => {
      fetchData()
    })
    .finally(() => {
      confirmDialog.value = false
      role_id.value = ''
    })
}
const show = id => {
  router.push(`/time/${id}`)
}

onMounted(() => {
  fetchData()
})
</script>

<template>
  <div>
    <VRow>
      <VCol
        cols="12"
        md="6"
        sm="12"
      >
        <VCard
          :title="$t('time1')"
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
              />
              <VCol
                cols="6"
                md="4"
                class="text-end"
              >
                <VBtn
                  v-if="canCreateTime"
                  size="large"
                  variant="elevated"
                  prepend-icon="mdi-plus"
                  color="info"
                  to="time/create"
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
                  />
                </td>
                <tr v-if="loading && data.length === 0">
                  <td
                    :colspan="headers.length"
                    class="text-center"
                  >
                    <div class="text-subtitle-2">
                      {{ $t('in progress') }}
                    </div>
                  </td>
                </tr>
                <tr v-if="!loading && data.length === 0">
                  <td
                    :colspan="headers.length"
                    class="text-caption text-center"
                  >
                    {{ $t('No data stored') }}
                  </td>
                </tr>
                <tr
                  v-for="row in data"
                  :key="row.id"
                >
                  <td v-text="row.time" />
                  <td>
                    <VBtn
                      v-if="canEditTime"
                      color="white"
                      elevation="0"
                      flat
                      @click="show(row.id)"
                    >
                      <VIcon color="success">
                        mdi-square-edit-outline
                      </VIcon>
                      <VTooltip
                        activator="parent"
                        location="bottom"
                      >
                        {{ $t('edit') }}
                      </VTooltip>
                    </VBtn>
                    <VBtn
                      v-if="canDeleteTime"
                      color="white"
                      elevation="0"
                      flat
                      @click="onDelete(row.id)"
                    >
                      <VIcon color="error">
                        mdi-delete-outline
                      </VIcon>
                      <VTooltip
                        activator="parent"
                        location="bottom"
                      >
                        {{ $t('delete') }}
                      </VTooltip>
                    </VBtn>
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
      </VCol>
    </VRow>
    <VDialog
      v-model="confirmDialog"
      style="max-width: 500px"
      persistent
    >
      <VCard>
        <VCardText> {{ $t('delete_time') }} </VCardText>
        <VCardActions class="ml-auto">
          <VBtn
            color="error"
            @click="confirmDialog = false"
          >
            {{ $t('no') }}
          </VBtn>
          <VBtn
            color="success"
            @click="confirmDelete"
          >
            {{ $t('yes') }}
          </VBtn>
        </VCardActions>
      </VCard>
    </VDialog>
  </div>
</template>

<route lang="yaml">
meta:
  title: Time
  layout: default
  subject: Auth
  active: 'time'
</route>
