--------------------------------------------------------
--  파일이 생성됨 - 수요일-4월-28-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_BOOKS_V1
--------------------------------------------------------

  CREATE TABLE "TBL_BOOKS_V1" 
   (	"BK_ISBN" CHAR(13), 
	"BK_COMP" NVARCHAR2(15), 
	"BK_TITLE" NVARCHAR2(125), 
	"BK_AUTHOR" NVARCHAR2(50), 
	"BK_TRNANS" NVARCHAR2(20), 
	"BK_DATE" VARCHAR2(10), 
	"BK_PAGES" NUMBER, 
	"BK_PRICE" NUMBER
   )
REM INSERTING into TBL_BOOKS_V1
SET DEFINE OFF;
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540770','비즈니스북스','데스 바이 아마존','시로타 마코토','신희원','04/15/2019',272,15000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850549','북라이프','4주 만에 완성하는 레깅스핏 스트레칭','모리 다쿠로','김현정','04/11/2019',132,13000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850518','북라이프','왕이 된 남자 2','김선덕',null,'04/10/2019',388,14000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850501','북라이프','왕이 된 남자 1','김선덕',null,'04/10/2019',440,14000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540756','비즈니스북스','새벽에 읽는 유대인 인생 특강','장대은',null,'04/10/2019',280,15000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850471','북라이프','왕이 된 남자 포토에세이','스튜디오 드래곤',null,'04/10/2019',368,25000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540732','비즈니스북스','오토노미 제2의 이동 혁명','로렌스 번스 -  크리스토퍼 슐건','김현정','03/31/2019',536,22000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540718','비즈니스북스','쓴다 쓴다 쓰는 대로 된다','후루카와 다케시','유나현','03/30/2019',232,13000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540695','비즈니스북스','머니패턴','이요셉 -  김채송화',null,'03/25/2019',264,15000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540671','비즈니스북스','1日 1行의 기적','유근용',null,'03/20/2019',500,13800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850440','북라이프','오늘도 울컥하고 말았습니다','정민지',null,'03/15/2019',248,13800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850426','북라이프','엘리트 제국의 몰락','미하엘 하르트만','이덕임','02/27/2019',376,16800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540640','비즈니스북스','아주 작은 습관의 힘','제임스 클리어','이한이','02/26/2019',360,16000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791186805398','비즈니스북스','그릿 GRIT(100쇄 기념 리커버 에디션)','앤절라 더크워스','김미정','02/20/2019',416,16000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540619','비즈니스북스','일단 오늘 한 줄 써봅시다','김민태',null,'02/15/2019',252,14000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540596','비즈니스북스','뉴파워 - 새로운 권력의 탄생','제러미 하이먼즈 -  헨리 팀스','홍지수','01/30/2019',456,18000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850402','북라이프','잊지 않고 남겨두길 잘했어','이유미',null,'01/29/2019',252,13500);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850389','북라이프','아이의 뇌에 상처 입히는 부모들','도모다 아케미','이은미','01/28/2019',240,13800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540572','비즈니스북스','어떻게 팔지 답답할 때 읽는 마케팅 책','리처드 쇼튼','이진원','01/18/2019',280,15000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540558','비즈니스북스','서른과 마흔 사이 나를 되돌아볼 시간','미리암 프리스','박지희','01/10/2019',316,15800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850365','북라이프','먹고사는 게 전부가 아닌 날도 있어서','노지양',null,'12/25/2018',256,13500);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850341','북라이프','선생님 -  저 우울증인가요?','오카다 다카시','김현정','12/20/2018',272,14800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540527','비즈니스북스','관계의 품격','오노코로 신페이','유나현','12/15/2018',232,13500);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850327','북라이프','백년 두뇌','하세가와 요시야','조해선','11/29/2018',236,14000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540503','비즈니스북스','세계미래보고서 2019','박영숙 -  제롬 글렌','이희령','11/24/2018',376,16500);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850303','북라이프','진정한 나로 살아갈 용기','브레네 브라운','이은경','11/23/2018',228,13500);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850280','북라이프','반려견 증상 상식 사전','김보윤',null,'11/15/2018',232,14800);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791188850266','북라이프','나를 사랑하는 일에 서툰 당신에게','안정현(마음달)',null,'10/31/2018',240,14000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540480','비즈니스북스','완벽한 재무제표 읽기','이강연',null,'10/30/2018',464,20000);
Insert into TBL_BOOKS_V1 (BK_ISBN,BK_COMP,BK_TITLE,BK_AUTHOR,BK_TRNANS,BK_DATE,BK_PAGES,BK_PRICE) values ('9791162540466','비즈니스북스','하워드 막스 투자와 마켓 사이클의 법칙','하워드 막스(Howard Marks)','이주영','10/29/2018',436,18000);
--------------------------------------------------------
--  DDL for Index SYS_C007093
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007093" ON "TBL_BOOKS_V1" ("BK_ISBN")
--------------------------------------------------------
--  Constraints for Table TBL_BOOKS_V1
--------------------------------------------------------

  ALTER TABLE "TBL_BOOKS_V1" ADD PRIMARY KEY ("BK_ISBN") ENABLE
  ALTER TABLE "TBL_BOOKS_V1" MODIFY ("BK_AUTHOR" NOT NULL ENABLE)
  ALTER TABLE "TBL_BOOKS_V1" MODIFY ("BK_TITLE" NOT NULL ENABLE)
  ALTER TABLE "TBL_BOOKS_V1" MODIFY ("BK_COMP" NOT NULL ENABLE)
