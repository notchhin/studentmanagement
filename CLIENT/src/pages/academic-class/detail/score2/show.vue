<!-- អង់គ្លេស -->
<script setup>
import { onMounted, reactive, ref, watch, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import api from '@/plugins/utilites'
import { Printd } from 'printd'
import * as XLSX from 'xlsx'
import { DataRankings, Grade } from '@/helper/calculate-score'
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
    Att: ret.att ?? 0,
    Quiz: ret.quiz ?? 0,
    HW: ret.hw ?? 0,
    SP: ret.sp ?? 0,
    LS: ret.ls ?? 0,
    ST: ret.st ?? 0,
    RD: ret.rd ?? 0,
    WT: ret.wt ?? 0,
    Mid: ret.t_mid ?? 0,
    Final: ret.t_final ?? 0,
    Total: ret.total ?? 0,
    Ave: ((ret.att ?? 0) + (ret.hw ?? 0) + (ret.quiz ?? 0) + (ret.rd ?? 0) + (ret.wt ?? 0) + (ret.ls ?? 0) + (ret.st ?? 0) + (ret.sp ?? 0)) / 8,
    Rank: ret.rank ?? 0,
    Grade: Grade(ret.total ?? 0),
    Result: ret.total >= 50 ? 'Pass' : 'Fail',
  }))

  const worksheet = XLSX.utils.json_to_sheet(worksheetData)
  const workbook = XLSX.utils.book_new()
  XLSX.utils.book_append_sheet(workbook, worksheet, 'Scores')
  XLSX.writeFile(workbook, `class-score-${route.query.id || 'export'}.xlsx`)
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
                  <tr style="font-family: 'Times New Roman', Times, serif; font-size: 17px">
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px"
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
                      colspan="11"
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
                    
                    <th
                      rowspan="2"
                      style="border: 1px solid black; padding: 5px; min-width: 120px; width: 120px; text-align: center;"
                    >
                      Pass/Fail
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
                      SP
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      LS
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      ST
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      RD
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      WT
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      Mid
                    </th>
                    <th
                      style="border: 1px solid black; padding: 5px"
                      colspan="1"
                    >
                      Final
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
                    <td style="text-align: center; border: 1px solid black; padding: 5px">
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
                      {{ ret.att ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.quiz ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.hw ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.sp ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.ls ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.st ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.rd ?? 0 }}
                    </td>
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px"
                    >
                      {{ ret.wt ?? 0 }}
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
                      {{ ret.t_final ?? 0 }}
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
                      {{ ((ret.att + ret.hw + ret.quiz + ret.rd + ret.wt + ret.ls + ret.st + ret.sp) / 8).toFixed(2) }}
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
                    
                    <td
                      colspan="1"
                      style="text-align: center; border: 1px solid black; padding: 5px; min-width: 120px; width: 120px;"
                    >
                      {{ (ret.total >= 59 ? 'Pass' : 'Fail') }}
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
                      >
                        <div style="padding: 0 5% 0 5%; border: 1px solid">
                          <tr>
                            <td>Note:</td>
                          </tr>
                          <tr>
                            <td>1. A = 90-100</td>
                          </tr>
                          <tr>
                            <td>2. B = 80-89</td>
                          </tr>
                          <tr>
                            <td>3. C = 70-79</td>
                          </tr>
                          <tr>
                            <td>4. D = 60-69</td>
                          </tr>
                          <tr>
                            <td>5. F = 0-59</td>
                          </tr>
                        </div>
                      </div>
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
@media print {
  img {
    width: 100px;
    height: 100px;
    max-width: none;
  }
}
</style>
