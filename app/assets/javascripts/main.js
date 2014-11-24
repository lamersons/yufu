////Функция скроллинга к нужному месту на странице
//function scrollToDiv(element,navheight){
//	var offset = element.offset();
//	var offsetTop = offset.top;
//	var totalScroll = offsetTop-navheight;
//	$("BODY, HTML").animate({
//		scrollTop: totalScroll
//	}, 1000);
//}//scrollToDiv
//
//$(document).ready(function() {
//
//	//Языковое меню
//	$("DIV.nav-top DIV.lang A").click(function(e) {
//		e.preventDefault();
//		var langMenu = $("DIV.nav-top DIV.select-lang");
//		if(langMenu.is(":visible")) {
//			langMenu.hide();
//		} else {
//			langMenu.show();
//		}
//	});//click
//
//	//Подсказки
//	$(".js-tooltip").hover(function() {
//		var target = $(this).data("target");
//		$(target).fadeIn();
//	}, function() {
//		var target = $(this).data("target");
//		$(target).fadeOut();
//	});//hover
//
//	//Выбор файла дропом
//	//Загрузка файла
//	$("INPUT.fileupload-with-dropzone").fileupload({
//		dropZone: $(this).data("dropzone"),
//		//Загрузка начинается автоматически - сразу после выбора файла
//		autoUpload: true,
//		//Вид данных ответа сервера - сейчас простой html
//		dataType: "html",
//		//Пусть к обработчику загрузки файла
//		url: $(this).data("url"),
//		//Обработчик события начала загрузки
//		submit: function(e, data) {
//			alert("Начата загрузка");
//		},
//		//Обработчик события окончания загрузки и обработки файла на сервере.
//		//Отрабатывает когда сервер возвращает ответ
//		//На сервере файл доступен как после отрпавки обычной формы с полем типа file. Напрмиер, в php массив $_FILES
//		done: function(e, data) {
//			alert("Загрузка завершена");
//			alert("Статус ответа сервера: " + data.textStatus);
//			alert("HTML ответ сервера: " + data.result);
//		}
//	});//fileupload
//
//	//Кастомный скроллбар внутри модального окна. Его инициализация должна идти ДО инициализации
//	//модального окна, которое его содержит!
//	$("DIV.modal DIV.scroll").jScrollPane({
//		showArrows: true
//	});//jScrollPane
//	//Модальные окна
//	//Спрячем модальные окна. Примечания - в CSS файле
////	$("DIV.modal").css("visibility", "visible").hide();
////	$("DIV.modal-bg").css("visibility", "visible").hide();
//	//По клику по ссылке покажем модальное окно
//	$(".modal-trigger").click(function() {
//		//Какое окно показывать
//		var modal = $("DIV.modal." + $(this).data("modal"));
//		modal.fadeIn();
//		$("DIV.modal-bg").fadeIn();
//		return false;
//	});//click
//	//По клику на крестик прячем модальное окно
//	$("DIV.modal .close").click(function() {
//		$(this).parents("DIV.modal").fadeOut();
//		$("DIV.modal-bg").fadeOut();
//	});//click
//
//	//Зарабатывайте с нами
//	//Первый ли раз отображаем содержимое
//	var secondBlockFirstTime = true;
//	$("DIV.block.second DIV.item").click(function() {
//		//Спрячем подсказку под блоком
//		$(this).find("DIV.tooltip").fadeOut();
//		//Снимем активный класс со всех блоков
//		$("DIV.block.second DIV.item").removeClass("active");
//		//Добавим класс выбранному блоку
//		$(this).addClass("active");
//		//Спрячем все стрелки и сделаем курсоры на них обычными
//		$("DIV.block.second DIV.item SPAN.arrow").hide().css("cursor", "default");
//		//Отобразим стрелку этого блока
//		$(this).find("SPAN,arrow").show();
//		//Маркер выбранного блока
//		var target = $(this).data("target");
//		//Поменяем текст ниже поля формы
//		$("FORM.reg-form P.after-input-text").html("Или выбери другой вид регистраци выше");
//		if(target == "translator") {
//			$("FORM.reg-form DIV.now").html("Зарегистрируйся сейчас<br>как Переводчик");
//            $('#main_register_type').val('translator');
//		} else if(target == "supplier") {
//			$("FORM.reg-form DIV.now").html("Зарегистрируйся сейчас<br>как Поставщик услуг");
//            $('#main_register_type').val('supplier');
//		} else if(target == "agent") {
//			$("FORM.reg-form DIV.now").html("Зарегистрируйся сейчас<br>как Агент");
//            $('#main_register_type').val('agent');
//		}
//        $('#main_register_submit').removeAttr('disabled');
//		//Сначала спрячем все текстовые блоки
//		$("DIV.block.second P.text-block").hide();
//		//Отобразим нужный текстовый блок
//		//Если мы первый раз отображаем блок, то нужно плавно отобразить - блок должен выехать
//		if(secondBlockFirstTime) {
//			$("DIV.block.second P.text-block." + target).slideDown();
//			secondBlockFirstTime = false;
//		} else {
//			$("DIV.block.second P.text-block." + target).show();
//		}
//		//Разблокируем форму
//		$("FORM.reg-form INPUT.email").attr("readonly", false);
//		//Стрелкам присвоим нужный класс
//		$("DIV.block.second DIV.item SPAN.arrow").removeClass("icons-arrow-second-default").removeClass("icons-arrow-second-h").addClass("icons-arrow-second-click");
//	});//click
//	//Стрелки. Будем ставить нужные классы пока не кликнули первый раз по пункту
//	$("DIV.block.second DIV.item").hover(function() {
//		if(secondBlockFirstTime) {
//			$(this).find("SPAN.arrow").removeClass("icons-arrow-second-default").addClass("icons-arrow-second-h");
//		}
//	}, function() {
//		if(secondBlockFirstTime) {
//			$(this).find("SPAN.arrow").removeClass("icons-arrow-second-h").addClass("icons-arrow-second-default");
//		}
//	});//hover
//
//	//Подсказка показывается при наведении на кнопку и на поле ввода почты, если поле для почты заблокировано
//	$("FORM.reg-form INPUT[type=email], FORM.reg-form BUTTON[type=submit]").hover(function() {
//		//Если поле еще заблокировано, то покажем подскзку
//		if(secondBlockFirstTime) {
//			$("FORM.reg-form DIV.tooltip").fadeIn();
//		}
//	}, function() {
//		$("FORM.reg-form DIV.tooltip").fadeOut();
//	});//hover
//
//
//});//ready