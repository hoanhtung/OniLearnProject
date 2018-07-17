//Notify all
function notifyAll(notice) {
    $.notify(notice, {className: "success", position: "top center"});
  }
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
    var div = '<div class="field row" style="margin-top: 20px">';
    var new_answer_field = '<div class="col-xs-9 col-sm-10 col-md-11"><textarea name="question[answers_attributes]['+ index +'][content]" class="form-control"></textarea></div>';
    var checkbox_answer = '<div class="col-xs-3 col-sm-2 col-md-1"><input type="checkbox" value="1" name="question[answers_attributes][' + index + '][is_right]" style="margin: 2px">';
    var remove_answer_btn = '<button type="button" class="btn btn-xs btn-danger" onclick="removeAnswerField(event)"><i class="fa fa-minus-circle"></i></button></div>';
    div += new_answer_field;
    div += checkbox_answer;
    div += remove_answer_btn;
    div += '</div>';
    $("#answer_field").append(div);
}
function removeAnswerField(event) {
    $(event.target).closest('.field').remove();
}