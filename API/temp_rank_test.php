<?php
function ScoreRanking($data){
    array_multisort(array_column($data, 'total'), SORT_DESC, $data);
    $rank = 1;
    foreach ($data as $i => $d) {
        if ($i > 0 && ($d['total'] ?? 0) === ($data[$i-1]['total'] ?? 0)) {
            $data[$i]['rank'] = $data[$i-1]['rank'];
        } else {
            $data[$i]['rank'] = $rank;
        }
        $rank++;
    }
    return $data;
}

$students = [
    ['student_id'=>1,'last_name'=>'A','first_name'=>'Alpha'],
    ['student_id'=>2,'last_name'=>'B','first_name'=>'Bravo']
];
$exams = [
    ['id'=>10,'student_id'=>1,'total'=>72],
    ['id'=>11,'student_id'=>2,'total'=>85]
];
$data = ScoreRanking(array_merge($students, $exams));
var_export($data);
?>
