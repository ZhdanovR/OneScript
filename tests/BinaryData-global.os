﻿///////////////////////////////////////////////////////////////////////
//
// Тест проверки поведения некоторых глобальных функций
// 
//
///////////////////////////////////////////////////////////////////////

Перем юТест;

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_Проверить_ДвоичныеДанныеИзСтрокиВСтроку");
	ВсеТесты.Добавить("ТестДолжен_Проверить_СоединитьДвоичныеДанные");
	ВсеТесты.Добавить("ТестДолжен_Проверить_РазбитьДвоичныеДанные");
	
	Возврат ВсеТесты;
КонецФункции

// 
////////////////////////////////////////////////////////////////////


Процедура ТестДолжен_Проверить_ДвоичныеДанныеИзСтрокиВСтроку() Экспорт
	
	Строка1 = "Тестовая строка1";
	ДвоичныеДанные1 = ПолучитьДвоичныеДанныеИзСтроки(Строка1);	
	Строка2 = ПолучитьСтрокуИзДвоичныхДанных(ДвоичныеДанные1);

	юТест.ПроверитьРавенство(Строка1, Строка2);
	
КонецПроцедуры


Процедура ТестДолжен_Проверить_СоединитьДвоичныеДанные() Экспорт
	
	Строка1 = "Тестовая строка1";
	ДвоичныеДанные1 = ПолучитьДвоичныеДанныеИзСтроки(Строка1);
	Размер1 = ДвоичныеДанные1.Размер();

	Строка2 = "ТестоваяСтрока2";
	ДвоичныеДанные2 = ПолучитьДвоичныеДанныеИзСтроки(Строка2);
	Размер2 = ДвоичныеДанные2.Размер();

	МассивДанных = Новый Массив();
	МассивДанных.Добавить(ДвоичныеДанные1);
	МассивДанных.Добавить(ДвоичныеДанные2);
	ДвоичныеДанные3 = СоединитьДвоичныеДанные(МассивДанных);
	
	юТест.ПроверитьРавенство(ДвоичныеДанные3.Размер(), Размер1 + Размер2);

КонецПроцедуры

Процедура ТестДолжен_Проверить_РазбитьДвоичныеДанные() Экспорт

	Строка1 = "Тестовая строка1";
	ДвоичныеДанные1 = ПолучитьДвоичныеДанныеИзСтроки(Строка1);
	Размер1 = ДвоичныеДанные1.Размер();

	Строка2 = "ТестоваяСтрока2";
	ДвоичныеДанные2 = ПолучитьДвоичныеДанныеИзСтроки(Строка2);
	Размер2 = ДвоичныеДанные2.Размер();

	МассивДанных = Новый Массив();
	МассивДанных.Добавить(ДвоичныеДанные1);
	МассивДанных.Добавить(ДвоичныеДанные2);
	ДвоичныеДанные3 = СоединитьДвоичныеДанные(МассивДанных);

	РазмерБлока = 6;
	РазмерОстатка = ДвоичныеДанные3.Размер() % РазмерБлока;
	КратныйРазмер = ДвоичныеДанные3.Размер() - РазмерОстатка;
	КоличествоБлоков = КратныйРазмер/РазмерБлока;

	Если Не РазмерОстатка = 0 Тогда
		КоличествоБлоков = КоличествоБлоков + 1;
	КонецЕсли;

	МассивДанных = РазделитьДвоичныеДанные(ДвоичныеДанные3, РазмерБлока);

	юТест.ПроверитьРавенство(МассивДанных.Количество(), КоличествоБлоков, "Не совпадает количество блоков");

	Индекс = 0;

	Для Каждого Элемент Из МассивДанных Цикл

		Если (Не Индекс = КоличествоБлоков - 1) Тогда
			юТест.ПроверитьРавенство(Элемент.Размер(), РазмерБлока, "Не совпадает размер блока");
		КонецЕсли;

		Если (Индекс = КоличествоБлоков - 1) Тогда
		
			Если РазмерОстатка = 0 Тогда
				юТест.ПроверитьРавенство(Элемент.Размер(), РазмерБлока, "Не совпадает размер последнего блока");
			Иначе
				юТест.ПроверитьРавенство(Элемент.Размер(), РазмерОстатка, "Не совпадает размер последнего блока");
			КонецЕсли;
	
		КонецЕсли;

		Индекс = Индекс + 1;

	КонецЦикла;

КонецПроцедуры













