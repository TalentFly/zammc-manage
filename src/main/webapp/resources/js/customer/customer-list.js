//删除顾客
$('.deleteCustomer').click(function (e) {
    console.log("删除顾客信息");
    var url = common.ctx + $(this).attr('url');
    var userId = $(this).attr('data');
    common.confirm({
        title: '顾客删除',
        message: '是否删除当前顾客信息？'
    }, function () {
        $.ajax({
            url: url,
            type: 'post',
            data: {
                userId: userId
            },
            success: common.options.success
        })
    })
});