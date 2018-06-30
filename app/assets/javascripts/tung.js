
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

var index = 1;
function appendNewAnswerInput() {
    index += 1;
    var div = '<div class="field">';
    var new_answer_field = '<textarea name="question[answers_attributes]['+ index +'][content]"></textarea>';
    var checkbox_answer = '<input type="checkbox" value="1" name="question[answers_attributes][' + index + '][is_right]">';
    var remove_answer_btn = '<button type="button" onclick="removeAnswerField(event)">x</button><br/>';
    div += new_answer_field;
    div += checkbox_answer;
    div += remove_answer_btn;
    div += '</div>';
    $("#answer_field").append(div);
}
function removeAnswerField(event) {
    $(event.target).closest('.field').remove();
}