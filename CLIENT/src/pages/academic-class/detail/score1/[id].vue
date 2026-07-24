<script setup>
import { onMounted } from "vue"
import { useRoute, useRouter } from "vue-router"
import api from "@/plugins/utilites"
const { params } = useRoute()
const router = useRouter()
const params_id = ref(null)
const params_create = ref(null)
const model = ref({})

const fetchData = () => {
  api
    .post("academic-classes-detail", {
      id: params_id.value,
    })
    .then(res => {
      model.value = res.data.model
    })
}

// const months = ref([
//   {
//     id: 0,
//     name: "ឆមាសទី១",
//     semester: 1,
//   },
//   {
//     id: 0,
//     name: "ឆមាសទី២",
//     semester: 2,
//   },
// ]);

const onSelectMonth = (id, s) => {
  if (params_create.value) {
    router.push(
      `/academic-class/detail/score/show/${params_id.value}_${id}${
        s != undefined ? "_" + s : ""
      }`,
    )
  } else {
    router.push(
      `/academic-class/detail/score/create/${params_id.value}_${id}${
        s != undefined ? "_" + s : ""
      }`,
    )
  }
}

const study_months = ref([])

const fetchMonth = () => {
  api
    .post("academic-classes-month", {
      id: params_id.value,
    })
    .then(res => {
      study_months.value = res.data
    })
}

onMounted(() => {
  [params_id.value, params_create.value] = params.id.split("_")
  fetchData()
  fetchMonth()
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
        <VCard
          :title="`ថ្នាក់ទី ${model?.name} ឆ្នាំសិក្សា ${model?.academic_year?.name}`"
        >
          <VDivider />
          <VBtn
            class="mt-5 mx-5"
            color="secondary"
            variant="outlined"
            @click="$router.go(-1)"
          >
            <VIcon>mdi-arrow-back</VIcon>&nbsp;ថយក្រោយ
          </VBtn>
          <VCardText>
            <div class="text-h6 font-weight-bold">
              ជ្រើសរើសខែសម្រាប់{{ params_create ? "បង្ហាញ" : "ដាក់" }}ពិន្ទុ
            </div>
            <VRow class="mt-5">
              <VCol
                v-for="month in study_months"
                :key="month"
                cols="12"
                md="6"
                lg="6"
                sm="6"
              >
                <VCard @click="onSelectMonth(month.id, month.semester)">
                  <VCardTitle class="text-center">
                    {{ month.name }}
                  </VCardTitle>
                </VCard>
              </VCol>
            </VRow>
            <div class="text-h6 font-weight-bold my-7">
              ជ្រើសរើសឆមាសសម្រាប់{{ params_create ? "បង្ហាញ" : "ដាក់" }}ពិន្ទុ
            </div>
            <VRow class="mt-5">
              <VCol
                v-for="month in months"
                :key="month"
                cols="12"
                md="6"
                lg="6"
                sm="6"
              >
                <VCard @click="onSelectMonth(month.id, month.semester)">
                  <VCardTitle class="text-center">
                    {{ month.name }}
                  </VCardTitle>
                </VCard>
              </VCol>
            </VRow>
          </VCardText>
        </VCard>
      </VCol>
    </VRow>
  </div>
</template>

<route lang="yaml">
  meta:
    title: score-update
    layout: default
    subject: Auth
    active: 'academic-class'
  </route>
