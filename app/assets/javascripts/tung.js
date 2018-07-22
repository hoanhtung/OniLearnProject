//Notify all
function notifyAll(notice) {
    $.notify(notice, {className: "success", position: "top center"});
}
var cate_id;
function getSubjectById() {
    var subject_selected = $("#course_subject_id").children(":selected").attr("value");
    $.ajax({
        url: '/api/subject_by_id',
        method: 'get',
        data: {subject_id: subject_selected},
        success: function(data) {
            cate_id = data.cate_id;
            getCategories();
        }
    });
}

function getCategories() {
    $.ajax({
        url: '/api/all_categories',
        method: 'get',
        success: function(data) {
            $('#category_select_div').empty();
            $('#category_select_div').append("<select class='form-control' id='category_select' onchange='getSubjectByCateId(this.options[this.selectedIndex].value)'>")
            for (i = 0; i < data.length; i++) {
                if (data[i].id == cate_id ) {
                    $('#category_select').append("<option selected='selected' value="+ data[i].id+ ">"+ data[i].name + "</option>")
                } else {
                    $('#category_select').append("<option value="+ data[i].id+ ">"+ data[i].name + "</option>")
                }
            }
            $('#category_select_div').append("</select>")       
        }
    })
}  
function getSubjectByCateId(id) {
    $.ajax({
        url: '/all_subject_by_category_id',
        method: 'get',
        data: {category_id: id},
        success: function(data) {
            $('#subject_select').empty();
            $('#subject_select').append("<select class='form-control' name='course[subject_id]' id='subject_select_id' onchange='getCourseBySubId(this.options[this.selectedIndex].value)'>")
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
    var checkbox_answer = '<div class="col-xs-3 col-sm-2 col-md-1"><input type="checkbox" name="question[answers_attributes][' + index + '][is_right]" style="margin: 2px">';
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
function preview_image(event) {
    var reader = new FileReader();
    reader.onload = function() {
        var output = $(event.target).next();
        output.css("backgroundImage", "url(" + reader.result +  ")");
        output.css("display", "block");
    }
    reader.readAsDataURL(event.target.files[0]);
}

var new_image_field = "<div class='file_field'><button type='button' class='btn btn-dark btn-image'><i class='fa fa-image fa-3x'/></button>" +
                     "<input class='image-input' onchange='preview_image(event)' type='file' name='subject[image]' id='subject_image'/>" +
                     "<div class='image-output'><div class='btn btn-danger image-remove' onclick='remove_image(event)'><i class='fa fa-trash'></i></div></div></div>" ;  

var new_icon_field = "<div class='file_field'><button type='button' class='btn btn-dark btn-image'><i class='fa fa-image fa-3x'/></button>" +
                     "<input class='image-input' onchange='preview_image(event)' type='file' name='course[icon]' id='course_icon'/>" +
                     "<div class='image-output'><div class='btn btn-danger image-remove' onclick='remove_icon(event)'><i class='fa fa-trash'></i></div></div></div>" ;                     
function remove_image(event) {
    var file_field = $(event.target).parents(".file_field");
    file_field.remove();
    $("#file_field_subject_container").append(new_image_field);
}
function remove_icon(event) {
    var file_field = $(event.target).parents(".file_field");
    file_field.remove();
    $("#file_field_course_container").append(new_icon_field);
}