export const DataRankings = data => {
  // Sort the data by total score in descending order
  data.value.sort((a, b) => b.total - a.total)

  // Assign ranks, ensuring that items with the same total score get the same rank
  let rank = 1
  data.value.forEach((item, index) => {
    if (index > 0 && item.total === data.value[index - 1].total) {
      item.rank = data.value[index - 1].rank
    } else {
      item.rank = rank
    }
    rank++
  })

  return data
}

export const Result = total => {
  if (total >= 50) return 'Pass'
  
  return 'Fail'
}

export const Grade = score => {
  if (score >= 90) return 'A'
  if (score >= 80) return 'B'
  if (score >= 70) return 'C'
  if (score >= 60) return 'D'
  
  return 'F'
}
export const GradePlus = score => {
  if (score >= 97) return 'A+'
  if (score >= 93) return 'A'
  if (score >= 90) return 'A-'
  if (score >= 87) return 'B+'
  if (score >= 83) return 'B'
  if (score >= 80) return 'B-'
  if (score >= 77) return 'C+'
  if (score >= 73) return 'C'
  if (score >= 70) return 'C-'
  if (score >= 67) return 'D+'
  if (score >= 63) return 'D'
  if (score >= 60) return 'D-'

  return 'F'
}
