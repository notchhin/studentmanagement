<!-- កុំព្យូទ័រ -->
<script setup>
import { onMounted, reactive, ref, watch, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import api from '@/plugins/utilites'
import { Printd } from 'printd'
import * as XLSX from 'xlsx'
import { DataRankings, Grade, Result } from '@/helper/calculate-score'
const route = useRoute()
const model = ref({})
const data = ref([])
const refForm = ref()
const d = new Printd()

const imgP = `
  table{
    margin-top: -20px;
    margin: 0;
  }
  img{
    margin: 0;
    width: 90px;
    height: auto;
    max-width: none;
  }`
const onPrint = () => {
  d.print(document.getElementById('table'), [imgP])
}

const exportToXlsx = () => {
  const worksheetData = data.value.map((ret, index) => ({
    No: index + 1,
    Name: `${ret.last_name} ${ret.first_name}`,
    Sex: ret.gender == 1 ? 'ប្រុស' : 'ស្រី',
    Att: ret.m_att ?? 0,
    Quiz: ret.m_quiz ?? 0,
    HW: ret.m_hw ?? 0,
    PP: ret.m_pp ?? 0,
    PC: ret.m_pc ?? 0,
    Mid: ret.t_mid ?? 0,
    Total: ret.total ?? 0,
    Ave: ((ret.m_att ?? 0) + (ret.m_hw ?? 0) + (ret.m_quiz ?? 0) + (ret.m_pp ?? 0) + (ret.m_pc ?? 0) + (ret.t_mid ?? 0)) / 6,
    Rank: ret.rank ?? 0,
    Grade: Grade(ret.total ?? 0),
  }))

  const worksheet = XLSX.utils.json_to_sheet(worksheetData)
  const workbook = XLSX.utils.book_new()
  XLSX.utils.book_append_sheet(workbook, worksheet, 'Scores')
  XLSX.writeFile(workbook, `class-score3-${route.query.id || 'export'}.xlsx`)
}

const fetchData = () => {
  api
    .post('academic-classes-detail', {
      id: route.query.id,
    })
    .then(res => {
      model.value = res.data.model
    })
  fetchTable()
}

const fetchTable = () => {
  api
    .post('exam-show', {
      academic_class_id: route.query.id,
    })
    .then(res => {
      data.value = res.data.data
      DataRankings(data) //ranking
    })
}
const currentYear = computed(() => new Date().getFullYear())

onMounted(() => {
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
        >
          <VCard :title="`${$t('class')} ${model.level?.level} ${$t('academic_year')} ${model.academic_year?.name}`">
            <VDivider />
            <VBtn
              class="mt-5 mx-5"
              color="secondary"
              variant="outlined"
              @click="$router.go(-1)"
            >
              <VIcon>mdi-arrow-back</VIcon>&nbsp; {{ $t('back') }}
            </VBtn>
            <VCardText>
              <VRow class="text-h6 font-weight-bold text-center mx-3">
                <div style="width: 40%" />
                <VRow style="width: 60%">
                  <VSpacer />
                  <div>
                    <VBtn
                      flat
                      color="white"
                      @click="onPrint"
                    >
                      <VIcon color="grey">
                        mdi-printer
                      </VIcon>
                    </VBtn>
                    <VBtn
                      flat
                      color="white"
                      @click="exportToXlsx"
                    >
                      <VIcon color="grey">
                        mdi-file-excel
                      </VIcon>
                    </VBtn>
                  </div>
                </VRow>
              </VRow>
              <table
                id="table"
                style="
                  width: 98%;
                  font-family: Khmer OS Battambang;
                  border-collapse: collapse;
                  padding: 5px;
                  color: black;
                "
              >
                <colgroup>
                  <col width="2%">
                  <col width="8%">
                  <col width="8%">
                  <col width="8%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                  <col width="5%">
                </colgroup>
                <thead>
                  <tr>
                    <td>
                      <VRow>
                        <VCol style="margin: 0 90%">
                          <VImg
                            src="/src/assets/images/logo_school.png"
                            :width="100"
                          />
                        </VCol>
                      </VRow>
                    </td>

                    <td colspan="14" />
                    <td
                      colspan="8"
                      valign="bottom"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 30px;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      KINGDOM OF CAMBODIA
                    </td>
                  </tr>
                  <tr>
                    <td
                      colspan="4"
                      valign="center"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 30px;
                        font-size: 16px;
                        font-family: 'Siemreap', Times, serif;
                      "
                    >
                      សាលារៀនជំនួយដល់កុមារកម្ពុជា
                    </td>
                    <td colspan="3" />
                    <td colspan="8" />
                    <td
                      colspan="8"
                      valign="center"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 30px;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      NATION RELIGION KING
                    </td>
                  </tr>
                  <tr>
                    <td
                      colspan="4"
                      valign="center"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 30px;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      Schools Helping Cambodian Children
                    </td>
                    <td colspan="3" />
                    <td colspan="8" />
                    <td
                      colspan="8"
                      valign="center"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 30px;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    />
                  </tr>
                  <tr>
                    <td
                      colspan="4"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 30px;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    />
                    <td
                      colspan="12"
                      style="
                        text-align: center;
                        font-weight: bold;
                        line-height: 50px;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      {{ model.academic_year?.name }}
                      <!--
                        {{ exam_month.id != 0 ? 'ខែ' : '' }}{{ exam_month.name
                        }}{{ params_s ? 'លើកទី' + params_s : '' }} 
                      -->
                    </td>
                  </tr>

                  <tr style="line-height: 30px">
                    <td
                      colspan="2"
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 15px;
                        font-family: 'Siemreap', Times, serif;
                      "
                    >
                      Teacher : {{ model.teacher?.name }}
                    </td>
                    <td
                      colspan="4"
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Room : {{ model.room?.room }}
                    </td>
                  </tr>
                  <tr style="line-height: 40px">
                    <td
                      colspan="2"
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      &nbsp;&nbsp; Level &nbsp;: {{ model.level?.level }}
                    </td>
                    <td
                      colspan="4"
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                    >
                      &nbsp; Time &nbsp;: {{ model.time?.time }}
                    </td>
                  </tr>
                  <tr style="font-family: 'Times New Roman', Times, serif; font-size: 16px">
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 4px 2px; min-width: 24px; width: 24px"
                    >
                      N<sup>o</sup>
                    </th>
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px"
                      colspan="3"
                    >
                      Name
                    </th>
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px"
                    >
                      Sex
                    </th>
                    <th
                      colspan="7"
                      style="border: 1px solid black; padding: 5px"
                    >
                      Score
                    </th>
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px; min-width: 90px; width: 90px; text-align: center;"
                    >
                      Ave.
                    </th>
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px; min-width: 110px; width: 110px; text-align: center;"
                    >
                      Rank
                    </th>
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px; min-width: 120px; width: 120px; text-align: center;"
                    >
                      Grade
                    </th>
                  </tr>
                  <tr>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      Att
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      Quiz
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      HW
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      PP
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      PC
                    </th>
                    
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      T.Mid
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      Total
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(ret, index) in data"
                    :key="index"
                  >
                    <td style="text-align: center; border: 1px solid black; padding: 4px 2px; min-width: 24px; width: 24px;">
                      {{ index + 1 }}
                    </td>
                    <td
                      colspan="3"
                      style="border: 1px solid black; padding: 5px"
                    >
                      {{ ret.last_name + ' ' + ret.first_name }}
                    </td>
                    <td style="text-align: center; border: 1px solid black; padding: 5px">
                      {{ ret.gender == 1 ? 'ប្រុស' : 'ស្រី' }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.m_att ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.m_quiz ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.m_hw ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.m_pp ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.m_pc ?? 0 }}
                    </td>
                    
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.t_mid ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.total ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px; min-width: 90px; width: 90px;"
                    >
                      {{ ((ret.m_att + ret.m_hw + ret.m_quiz + ret.m_pp + ret.m_pc + ret.t_mid) / 6).toFixed(2) }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px; min-width: 110px; width: 110px;"
                    >
                      {{ ret.rank ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px; min-width: 120px; width: 120px;"
                    >
                      {{ Grade(ret.total ?? 0) }}
                    </td>
                  </tr>
                  <td
                    style="height: 45px"
                    colspan="8"
                  />
                  <td colspan="3">
                    <table>
                      <div
                        style="
                          width: 150%;
                          height: 2vh;
                          font-weight: bold;
                          font-size: 16px;
                          font-family: 'Times New Roman', Times, serif;
                        "
                      />
                    </table>
                  </td>
                  <tr>
                    <td
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                      colspan="3"
                    >
                      Date ........./................/{{ currentYear }}
                    </td>
                  </tr>
                  <tr>
                    <td
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                      colspan="3"
                    >
                      Seen and approved
                    </td>
                    <td colspan="12" />
                    <td
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                      colspan="18"
                    >
                      Date ......./.........................../{{ currentYear }}
                    </td>
                  </tr>
                  <tr>
                    <td
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                      colspan="3"
                    >
                      Director
                    </td>
                    <td
                      style="text-align: center"
                      colspan="12"
                    />
                    <td
                      style="
                        text-align: center;
                        font-weight: bold;
                        font-size: 16px;
                        font-family: 'Times New Roman', Times, serif;
                      "
                      colspan="16"
                    >
                      TEACHER
                    </td>
                  </tr>
                  <tr>
                    <td
                      style="text-align: center"
                      colspan="10"
                    />
                    <td
                      style="text-align: center; font-family: Khmer OS Battambang"
                      colspan="10"
                    >
                      <!-- ហត្ថលេខាគ្រូបន្ទុក -->
                    </td>
                  </tr>
                  <tr>
                    <td
                      style="text-align: center; height: 190px"
                      colspan="15"
                    />
                    <td
                      style="
                        text-align: right;
                        font-weight: bold;
                        font-size: 15px;
                        font-family: 'Siemreap', Times, serif;
                        height: 220px;
                      "
                      colspan="10"
                      class="mt-12"
                    >
                      {{ model.teacher?.name }}
                    </td>
                    <td
                      style="text-align: center"
                      colspan="2"
                    />
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

<style>
@page {
  size: A4 landscape;
  margin: 8mm;
}

@media print {
  html,
  body,
  #table {
    width: 100% !important;
    height: auto !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  body {
    font-size: 10px !important;
    line-height: 1.1 !important;
  }

  table#table {
    width: 100% !important;
    border-collapse: collapse !important;
    font-size: 10px !important;
    font-family: 'Times New Roman', Times, serif !important;
  }

  table#table th,
  table#table td {
    padding: 4px !important;
    line-height: 1.1 !important;
    vertical-align: middle !important;
    border: 1px solid black !important;
    white-space: nowrap !important;
  }

  table#table th {
    font-size: 10px !important;
  }

  table#table td {
    font-size: 9px !important;
  }

  #table td,
  #table th {
    overflow: visible !important;
  }

  tr {
    page-break-inside: avoid !important;
  }
}
</style>
