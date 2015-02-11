$(document).on('ready', function(){

    var Task = function(task){
        this.task = task;
        this.id = 'new';
    }

    var addTask = function(){
        var task = $('#newItemInput').val().trim();
        if(task){
            $("#newItemInput").val('');
            $("#newTaskForm, #newListItem").fadeToggle('fast', 'linear');
            $("#newList").append('<a href="#finish" class="" id="item"><li class="list-group-item">' + task.task + '<span class="arrow pull-right"><li class="glyphicon glyphicon-arraw-right"></span></li></a>');
        }
    };

    $("#newTaskForm").hide();
    $("#newListItem").on('click', function(){
        $("#newTaskForm, #newListItem").fadeToggle("fast", "linear");
    });

    $("#cancel").on('click', function(e){
        e.preventDefault();
        $("#newTaskForm, #newListItem").fadeToggle("fast", "linear");
    });


    $("#saveNewItem").on("click", function(e){
        e.preventDefault();
        addTask();
    });

    $("#newItemInput").on("keypress", function(e){
        if(e.which === 13){
            addTask();
        }
    });

    $(document).on("click", "#item", function(e){
        e.preventDefault();
        var task = this;
        advanceTask(task);
        this.id = "inProgress";
        $("#currentList").append(this.outerHTML);
    });

    $(document).on("click", "#inProgress", function(e){
        e.preventDefault();
        var task = this;
        task.id = "archived";
        var archivedTask = task.outerHTML.replace('glyphicon-arraw-right', 'glyphicon-remove');
        advanceTask(task);
        ("#archivedList").append(archivedTask);
    });

    $(document).on("click", "#archived", function(e) {
        e.preventDefault();
        var task = this;
        advanceTask(task);
    });

    // server request start

    // server request end

    $(".container").bind("DOMSubtreeModified", function(e){
        if(e.target.innerHTML.length > 0){
            $(".list-group-item").mouseenter(function(){
                $(this).find(".arraw").animate({marginRight: "0px"}, 0);
            }).mouseleave(function(){
                $(this).find(".arraw").stop().css("marginRight", "20px");
            }).click(function(){
                $(this).find(".arraw").stop().css("marginRight", "20px");
            });
        }
    });
});
