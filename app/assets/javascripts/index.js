//Функция скроллинга к нужному месту на странице
function scrollToDiv(element,navheight){
    var offset = element.offset();
    var offsetTop = offset.top;
    var totalScroll = offsetTop-navheight;
    $("BODY, HTML").animate({
        scrollTop: totalScroll
    }, 1000);
}//scrollToDiv

$(document).ready(function() {
	//Первый ряд блоков
	//Текущий блок
	//Первое наведение
	var firstBlockFirstTime = true;
	var firstBlockCurrentBlock;

    $("DIV.block.first DIV.item").mouseenter(function() {
        $(this).css("cursor", "pointer");
        $(this).find("DIV.over").fadeIn("fast");
    }).mouseleave(function() {
        $(this).find("DIV.over").fadeOut("fast");
    });

    $("DIV.block.first DIV.item").click(function(){
        scrollToDiv($("DIV.block DIV.item P.h2"), 20);
        var target = $(this).data("target");
        $("DIV.first-points DIV.container").hide();
        $("DIV.first-points").show();
        $("DIV.first-points DIV.container." + target).show();
    });
 	//$("DIV.block.first DIV.item").mouseenter(function() {
	//	//Скроллинг к нужному месту на странице
	//	scrollToDiv($("DIV.block.first"), 0);
	//	//Выбранный блок
	//	var target = $(this).data("target");
	//	//При повторном наведении на тот же блок ничего делать не будем
	//	if(firstBlockCurrentBlock != target) {
	//		//Прячем все оверы
	//		$("DIV.block.first DIV.item DIV.over").fadeOut();
	//		//Отображаем нужный овер
	//		$(this).find("DIV.over").fadeIn();
	//		//Отобразим пункты выбранного блока
	//		//Если в первый раз
	//		if(firstBlockFirstTime) {
	//			$("DIV.first-points DIV.container." + target).show();
	//			$("DIV.first-points").slideDown();
	//			firstBlockFirstTime = false;
	//		} else {
	//			$("DIV.first-points DIV.container").fadeOut();
	//			$("DIV.first-points DIV.container." + target).fadeIn();
	//		}
	//		//Меняем текущий блок
	//		firstBlockCurrentBlock = target;
	//	}//if
	//});//mouseenter
	//Оверы первого блока
	$("DIV.first-points DIV.item").hover(function() {
		$(this).addClass("active");
		$(this).find("DIV.over").fadeIn();
	}, function() {
		$(this).removeClass("active");
		$(this).find("DIV.over").fadeOut();
	});//hover
	//Прячем пункты первого блока
	$("DIV.first-points").hide();
	$("DIV.first-points DIV.container").hide();
	//Спрчем оверы
	$("DIV.first-points DIV.over").hide();
});//ready