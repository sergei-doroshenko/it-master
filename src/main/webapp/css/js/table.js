$( document ).ready(function() {    
    $("#list").jqGrid({
        url: "http://localhost:8080/issuetracker/Main.do",
        datatype: "json",
        jsonReader : {
            root: "rows",
            page: "page",
            total: "total",
            records: "records",
            repeatitems: true,
            cell: "cell",
            id: "id",
            userdata: "userdata",
            subgrid: {root:"rows", 
                repeatitems: true, 
               cell:"cell"
            }
        },
        mtype: "GET",
        colNames: ["Id", "Create Date", "Create By", "Modify Date", "Modify By",
                   "Summary", "Status", "Resolution", "Type", "Priority", "Project"],
        colModel: [
            { name: "id", width: 55},
            { name: "createdate", width: 90,sortable:true},
            { name: "createby", width: 80},
            { name: "modifydate", width: 80},
            { name: "modifyby", width: 80},
            { name: "summary", width: 100},
            { name: "status", width: 100},
            { name: "resolution", width: 100},
            { name: "type", width: 100},
            { name: "priority", width: 100},
            { name: "project", width: 100},
        ],
        pager: "#pager",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "invdate",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        caption: "Issues",
        height: $(".table-container").height()
    }); 
});    