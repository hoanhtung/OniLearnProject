
function getSubjectByCateId(id) {
    $.ajax({
        url: '/find_by_category_id',
        method: 'get',
        data: {cate_id: id},
        success: function(data) {
            $('#subject_select').empty();
            $('#subject_select').append("<select id='subject_select_id' onchange='getCourseBySubId(this.options[this.selectedIndex].value)'>")
            for (i = 0; i < data.subjects.length; i++) {
                $('#subject_select_id')
                .append("<option value="+ data.subjects[i].id+ ">"+ data.subjects[i].name + "</option>")
            }
            $('#subject_select').append("</select>")       
        }
    })
}

function getCourseBySubId(id) {
    $.ajax({
        url: '/find_by_subject_id',
        method: 'get',
        data: {sub_id: id},
        success: function(data) {
            $('#course_select').empty();
            $('#course_select').append("<select id='course_select_id' name='question[course_id]'>")
            for (i = 0; i < data.subjects.length; i++) {
                $('#course_select_id')
                .append("<option value="+ data.subjects[i].id+ ">"+ data.subjects[i].name + "</option>")
            }
            $('#subject_select').append("</select>")       
        }
    })
}

var new_answer_field = '<br><textarea name="question[answers_attributes][0][content]"></textarea>';
var remove_answer_btn = '<button type="button">x</button>';
function appendNewAnswerInput() {
    $("#answer_field").append(new_answer_field);
    $("#answer_field").append(remove_answer_btn);
}
function removeAnswerField() {
    
}