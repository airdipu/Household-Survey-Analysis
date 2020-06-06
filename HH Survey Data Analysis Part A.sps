* Encoding: UTF-8.
* Data preparation for PART_A Questions

GET FILE='C:\Users\HP\Desktop\Momota II phase Analysis\ANC\Basic_info.sav'.


MATCH FILES /FILE=*
  /FILE='C:\Users\P_B_Section_A.sav'
  /FILE='C:\Users\P_B_Section_B.sav'
  /FILE='C:\Users\P_B_Section_C.sav'
 /FILE='C:\Users\P_B_Section_C_ANC.sav'
 /FILE='C:\Users\P_B_Section_C_Danger.sav'
 /FILE='C:\Users\P_B_Section_C_PNC.sav'
/RENAME (ID = d0) 
  /DROP= d0.
EXECUTE.

SAVE OUTFILE='C:\Users\HP\Desktop\Momota II Phase analysis\ANC\P_B_FINAL.sav'.



* Variable Labels

GET FILE='C:\Users\HP\Desktop\Momota II Phase analysis\ANC\P_B_FINAL.sav'.


VARIABLE LABELS Upazila_Code "Upzila Name".
VALUE LABELS Upazila_Code 1 "Gowainghat" 2 "Golapganj" 3 "Balaganj" 4 "Companigonj".
EXECUTE .

FREQUENCIES Upazila_Code.

VARIABLE LABELS Q_101 "What is your current age?".
EXECUTE .

* Women's Age ====================================================

FREQUENCIES Q_101.

RECODE Q_101 (lowest thru 19=1) (20 thru 24=2) (25 thru 29=3) (30 thru 34=4) (35 thru high=5) into Q_101_RC.
VALUE LABELS Q_101_RC 1 "<20" 2 "20-24" 3 "25-29" 4 "30-34" 5 "35+". 
VARIABLE LABELS  Q_101_RC "Mother's Age Category".
EXECUTE.

FREQUENCIES Q_101_RC.
EXECUTE.

* Relation with Family Head ============================================

VARIABLE LABELS Q_102 "What is you marrital status?".
VALUE LABELS Q_102 1 "Married".
EXECUTE .

FREQUENCIES Q_102.
EXECUTE.

* Womans Age at their Marriage ==========================================

VARIABLE LABELS Q_103 "What was your age in the time of your marriage?".
EXECUTE .

FREQUENCIES Q_103.

RECODE Q_103 (lowest thru 17=1) (18 thru 22=2) (23 thru 27=3) (28 thru high =4) into Q_103_RC.
VALUE LABELS Q_103_RC 1 "<18" 2 "18-22" 3 "23-27" 4 "28+".
VARIABLE LABELS Q_103_RC "Marriage Age Category".
EXECUTE.

FREQUENCIES Q_103_RC.

* Literacy of Mothers ====================================================

FREQUENCIES Q_104.

VARIABLE LABELS Q_104 "Have you study in school or madrasha?".
VALUE LABELS Q_104 1 "Yes, School" 2 "Yes, Madrasha" 3 "Yes, Both" 4 "No".
EXECUTE.

FREQUENCIES Q_104.
EXECUTE.

* Year of Education  mothers====================================================

FREQUENCIES Q_105.

RECODE Q_105 (1 thru 4=1) (5 thru 5=2) (6 thru 9=3) (10 thru high=4) (else=0) into Q_105_RC.
VARIABLE LABELS Q_105_RC "Education Status of Mother".
VALUE LABELS Q_105_RC 1 "Incomplete Primary" 2 "Complete Primary" 3 "Incomplete Secondary" 4 "Secondary or Above" 0 "Illiterate".
EXECUTE .

FREQUENCIES Q_105_RC.

* What is your occupation (mothers)? =======================================

COMPUTE Q_106=0.
EXECUTE .

DO IF (Q_106_1=1).
RECODE Q_106(0=1).
END IF.
EXECUTE.

DO IF  (Q_106_2 = 1).
RECODE Q_106 (0=1).
END IF.
EXECUTE.

DO IF  (Q_106_3 = 1).
RECODE Q_106 (0=1).
END IF.
EXECUTE.

DO IF  (Q_106_4 = 1).
RECODE Q_106 (0=2).
END IF.
EXECUTE.

DO IF  (Q_106_5 = 1).
RECODE Q_106 (0=1).
END IF.
EXECUTE.

DO IF  (Q_106_6 = 1).
RECODE Q_106 (0=1).
END IF.
EXECUTE.

DO IF  (Q_106_96 = 1).
RECODE Q_106 (0=1).
END IF.
EXECUTE.

VARIABLE LABELS Q_106 "What is your occupation?".
VALUE LABELS Q_106 1 "Working" 2 "Not working".
EXECUTE.

FREQUENCIES  Q_106.
EXECUTE.

*What is your religion?=====================================================================

FREQUENCIES Q_107.

VARIABLE LABELS Q_107 "What is your religion?".
VALUE LABELS Q_107 1 "Islam" 2 "Hindu" 3 "Buddhist/Cristians" 96 "Others".
EXECUTE.

FREQUENCIES Q_107.
EXECUTE.

*Husbands age================================================

FREQUENCIES Q_108.

RECODE Q_108 (lowest thru 20=1) (21 thru 25=2) (26 thru 30=3) (31 thru 35=4) (36 thru 40=5) 
(41 thru 45=6) (46 thru 65=7) (99 thru high=8) into Q_108_RC.
VALUE LABELS Q_108_RC 1 "<21" 2 "21-25" 3 "26-30" 4 "31-35" 5 "36-40" 6 "41-45" 7 "45+" 8 "Don't know". 
VARIABLE LABELS  Q_108_RC "Husband's Age Category".
EXECUTE.

FREQUENCIES Q_108_RC.
EXECUTE.

* Husband's Education ================================

FREQUENCIES Q_109.

VARIABLE LABELS Q_109 "Have your husband study in school or madrasha?".
VALUE LABELS Q_109 1 "Yes, School" 2 "Yes, Madrasha" 3 "Yes, Both" 4 "No" 7 "Don't know".
EXECUTE.

FREQUENCIES Q_109.
EXECUTE.

* Literacy of Husbands ====================================================

FREQUENCIES Q_110.

RECODE Q_110 (1 thru 4=1) (5 thru 5=2) (6 thru 9=3) (10 thru 18=4) (99 thru high=5) (else=0) into Q_110_RC.
VARIABLE LABELS Q_110_RC "Education Status of Husband".
VALUE LABELS Q_110_RC 1 "Incomplete Primary" 2 "Complete Primary" 3 "Incomplete Secondary" 
4 "Secondary or Above" 0 "Illiterate" 5 "Don't know".
EXECUTE .

FREQUENCIES Q_110_RC.

*Husband's income===============================================

FREQUENCIES Q_111.

VARIABLE LABELS Q_111 "Did your husband do work for livelihood?".
VALUE LABELS Q_111 1 "Yes" 2 "No".
EXECUTE.

FREQUENCIES Q_111.
EXECUTE.

*Occupation of husband=====================================================

COMPUTE Q_112=0.
EXECUTE .

DO IF (Q_112_1=1).
RECODE Q_112(0=1).
END IF.
EXECUTE.

DO IF  (Q_112_2 = 1).
RECODE Q_112 (0=2).
END IF.
EXECUTE.

DO IF  (Q_112_3 = 1).
RECODE Q_112 (0=3).
END IF.
EXECUTE.

DO IF  (Q_112_5 = 1).
RECODE Q_112 (0=5).
END IF.
EXECUTE.

DO IF  (Q_112_6 = 1).
RECODE Q_112 (0=5).
END IF.
EXECUTE.

DO IF  (Q_112_7 = 1).
RECODE Q_112 (0=5).
END IF.
EXECUTE.

DO IF  (Q_112_96 = 1).
RECODE Q_112 (0=96).
END IF.
EXECUTE.

DO IF  (Q_112 = 0).
RECODE Q_112 (0=96).
END IF.
EXECUTE.

VARIABLE LABELS Q_112 "What is your husband's main occupation?".
VALUE LABELS Q_112 1 "Agriculture worker" 2 "Unskilled labour" 3 "Skilled labour" 5 "Bussiness and service" 96 "Others".
EXECUTE.

FREQUENCIES  Q_112.
EXECUTE.

*Gender of Family head=======================================================

FREQUENCIES Q_201.

VARIABLE LABELS Q_201 "Gender of household head?".
VALUE LABELS Q_201 1 "Male" 2 "Female" 3 "Others".
EXECUTE.

FREQUENCIES Q_201.
EXECUTE.


*Family members=======================================================

COMPUTE Q_207=Q_207_F+Q_207_M.
EXECUTE .
FREQUENCIES Q_207.

RECODE Q_207 (lowest thru 4=1) (5 thru 6=2) (7 thru high=3) into Q_207_RC.
VALUE LABELS Q_207_RC 1 "4 or less" 2 "5-6" 3 "7+".
VARIABLE LABELS  Q_207_RC 'Household Size'.
EXECUTE .

FREQUENCIES Q_207_RC.
MEANS Q_207_RC.

*Current children=======================================================

COMPUTE Q_301=Q_301_B+Q_301_G.
EXECUTE .
FREQUENCIES Q_301.

RECODE Q_301 (lowest thru 2=1) (3 thru high =2) into Q_301_RC.
VALUE LABELS Q_301_RC 1 "2 or less" 2 "More than 2".
EXECUTE .

FREQUENCIES Q_301_RC.
MEANS Q_301_RC.

* Household Economic conditions========================================

FREQUENCIES Q_215.

VARIABLE LABELS  Q_215 'Household Economic condition'.
VALUE LABELS Q_215 1 "Ultra poor" 2 "Poor" 3 "Middle class" 4 "Rich".
EXECUTE .

FREQUENCIES Q_215.
EXECUTE.

*Food secuirity=====================================================

FREQUENCIES Q_216.


*Nearest hospital==========================================================

COMPUTE Q_217=0.
EXECUTE .

DO IF  (Q_217_A = 1).
RECODE Q_217 (0=1).
END IF.
VARIABLE LABELS  Q_217 'Nearest Hospital'.
EXECUTE.

DO IF  (Q_217_B = 1).
RECODE Q_217 (0=2).
END IF.
EXECUTE.

DO IF  (Q_217_C = 1).
RECODE Q_217 (0=3).
END IF.
EXECUTE.

DO IF  (Q_217_D = 1).
RECODE Q_217 (0=4).
END IF.
EXECUTE.

DO IF  (Q_217_E = 1).
RECODE Q_217 (0=5).
END IF.
EXECUTE.

DO IF  (Q_217_F = 1).
RECODE Q_217 (0=6).
END IF.
EXECUTE.

DO IF  (Q_217_G = 1).
RECODE Q_217 (0=7).
END IF.
EXECUTE.

DO IF  (Q_217_H = 1).
RECODE Q_217 (0=8).
END IF.
EXECUTE.

DO IF  (Q_217_I = 1).
RECODE Q_217 (0=9).
END IF.
EXECUTE.

DO IF  (Q_217_J = 1).
RECODE Q_217 (0=10).
END IF.
EXECUTE.

DO IF  (Q_217_K = 1).
RECODE Q_217 (0=11).
END IF.
EXECUTE.

DO IF  (Q_217_L = 1).
RECODE Q_217 (0=12).
END IF.
EXECUTE.

DO IF  (Q_217_X= 1).
RECODE Q_217 (0=13).
END IF.
EXECUTE.


VALUE LABELS Q_217 1 "Medical College Hospital	A" 
2 "District Sadar Hospital	B" 
3 "Mother and Child Health Centre	C" 
4 "Upazila Health Complex	D" 
5 "Union Health and Family Welfare Centre/Sub Centre/RD	E" 
6 "Community Clinic	F" 
7 "Other govt. Hospitals	G" 
8 "NGO Health Centre	H" 
9 "NGO Permanent Health Centre 	I" 
10 "Non-government/Private Hospital/Clinic	J" 
11 "Private Heath Centre 	K" 
12 "Doctor’s Chaber 	L"
13 "Others".
EXECUTE .


FREQUENCIES  Q_217.

RECODE Q_217 (4=1) (5=2) (6=3) (7 thru 13=5) (else=5) into Q_217_RC.
VALUE LABELS Q_217_RC 1 "Upazila Health Complex: ABCD" 
2 "Union Health and Family Welfare Centre/Sub Centre/RD	E" 
3 "Community Clinic	F" 
4 "Satellite Climic/EPI Centre/Comunity Clinic 	K" 
5 "Others".
VARIABLE LABELS  Q_217_RC 'Nearest Hospital'.
EXECUTE.

FREQUENCIES  Q_217_RC.

*Distance between nearest hospital===============================================

VARIABLE LABELS Q_218 "Distance to nearest health center".
FREQUENCIES  Q_218.

RECODE Q_218 (lo thru 1=1) (1 thru 2 =2) (2 thru hi= 3) into Q_218_RC.
VALUE LABELS Q_218_RC 1 "1 KM or less" 2 "1-2 KM" 3 "More than 2 KM".
VARIABLE LABELS Q_218_RC "Distance to nearest health center".
EXECUTE .
FREQUENCIES Q_218_RC.

*ANC====================================================

VARIABLE LABELS  Q_401 'During your last pregnancy, did you receive any health service as ANC?'.
VALUE LABELS Q_401  1 "Yes" 2 "No".
EXECUTE.
FRE Q_401.

VARIABLE LABELS  Q_402 'If yes, how many times did you receive the ANC?'.
EXECUTE.
FRE Q_402.

* ANC from Medically trained Service Provider ===============================================================================

COMPUTE Q_402_MTSP=Q_402.
VARIABLE LABELS Q_402_MTSP "ANC from Medically trained Service Provider (MTSP)".
EXECUTE .

CROSSTABS Q_402_MTSP by Q_404.

DO IF  (Q_404 GT 1).
RECODE Q_402_MTSP (ELSE=0).
END IF.
EXECUTE.

FREQUENCIES Q_402_MTSP.
CROSSTABS Q_402_MTSP by Q_404.

RECODE Q_402_MTSP (1 thru high=1) (else=0) into Q_402_RC_1.
VARIABLE LABELS Q_402_RC_1 "ANC: At least 1".
VALUE LABELS Q_402_RC_1 1 "ANC: At least 1" 0 "None".
EXECUTE .

RECODE Q_402_MTSP (3 thru high=1) (else=0) into Q_402_RC_3.
VARIABLE LABELS Q_402_RC_3 "ANC: At least 3".
VALUE LABELS Q_402_RC_3 1 "ANC: At least 3" 0 "None".
EXECUTE .

RECODE Q_402_MTSP (4 thru high=1) (else=0) into Q_402_RC_4.
VARIABLE LABELS Q_402_RC_4 "ANC: At least 4".
VALUE LABELS Q_402_RC_4 1 "ANC: At least 4" 0 "None".
EXECUTE .

FRE Q_402 Q_402_MTSP Q_402_RC_1 Q_402_RC_3 Q_402_RC_4.


CROSSTABS
  /TABLES=Upazila_Code BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


CROSSTABS
  /TABLES= Q_101_RC BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_105_RC BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_106 BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_110_RC BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_112 BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_207_RC BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_107 BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_201 BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_215 BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_216 BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

*PNC=================================================================

FREQUENCIES Q_504.

VARIABLE LABELS  Q_504 'Did you receive any health service as PNC?'.
VALUE LABELS Q_504  1 "Yes" 2 "No".
EXECUTE.
FRE Q_504.

CROSSTABS
  /TABLES=Upazila_Code BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES= Q_101_RC BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_105_RC BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_106 BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_110_RC BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_112 BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_207_RC BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_107 BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_201 BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_215 BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_216 BY Q_504
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

*SBA==================================================================

* Place of delivery===============================================

VARIABLE LABELS  Q_501 'What is the delivery place of your (Name of Youngest child) child?'.
EXECUTE.

COMPUTE Q_501_RC=0.
EXECUTE .

DO IF  (Q_501 = "A").
RECODE Q_501_RC (0=1).
END IF.
EXECUTE.

DO IF  (Q_501 = "B").
RECODE Q_501_RC (0=2).
END IF.
EXECUTE.

DO IF  (Q_501 = "C").
RECODE Q_501_RC (0=3).
END IF.
EXECUTE.

DO IF  (Q_501 = "D").
RECODE Q_501_RC (0=4).
END IF.
EXECUTE.

DO IF  (Q_501 = "E").
RECODE Q_501_RC (0=5).
END IF.
EXECUTE.

DO IF  (Q_501 = "F").
RECODE Q_501_RC (0=6).
END IF.
EXECUTE.

DO IF  (Q_501 = "G").
RECODE Q_501_RC (0=7).
END IF.
EXECUTE.

DO IF  (Q_501 = "H").
RECODE Q_501_RC (0=8).
END IF.
EXECUTE.

DO IF  (Q_501 = "I").
RECODE Q_501_RC (0=9).
END IF.
EXECUTE.

DO IF  (Q_501 = "J").
RECODE Q_501_RC (0=10).
END IF.
EXECUTE.

DO IF  (Q_501 = "K").
RECODE Q_501_RC (0=11).
END IF.
EXECUTE.

DO IF  (Q_501 = "L").
RECODE Q_501_RC (0=12).
END IF.
EXECUTE.

DO IF  (Q_501 = "M").
RECODE Q_501_RC (0=13).
END IF.
EXECUTE.

DO IF  (Q_501 = "X").
RECODE Q_501_RC (0=14).
END IF.
EXECUTE.


FREQUENCIES  Q_501_RC.

RECODE Q_501_RC (1 thru 12=1) (13 thru 14=2) into Q_501_RC_1.
VARIABLE LABELS  Q_501_RC_1 'Facility delivery of your (Name of Youngest child) child?'.
VALUE LABELS Q_501_RC_1 1 "FD get" 2 "FD not get". 

FREQUENCIES  Q_501_RC_1.

* Facility Delivery ==================================================================

CROSSTABS
  /TABLES=Upazila_Code BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES= Q_101_RC BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_105_RC BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_106 BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_110_RC BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_112 BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_207_RC BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_107 BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_201 BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_215 BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_216 BY Q_501_RC_1
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

* Skilled Birth Attended ========================================================================

FREQUENCIES Q_503.

COMPUTE SBA=0.
VARIABLE LABELS SBA "Delivery by a Skilled Birth Attended".
VALUE LABELS SBA 1 "Skilled Birth Attended" 0 "Unskilled Birth Attended".
EXECUTE .

DO IF  (Q_501_RC_1 = 1).
RECODE SBA (0=1).
END IF.
EXECUTE.

DO IF  (Q_503 = 1).
RECODE SBA (0=1).
END IF.
EXECUTE.

FREQUENCIES SBA.

CROSSTABS
  /TABLES=Upazila_Code BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES= Q_101_RC BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_105_RC BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_106 BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_110_RC BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_112 BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_207_RC BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_107 BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_201 BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_215 BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Q_216 BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


*Household expenditure==============================================

FREQUENCIES Q_213.

RECODE Q_213 (0=SYSMIS)(1 thru 9999=1) (10000 thru 14999 =2) (15000 thru 19999 =3) (20000 thru high=4) into Q_213_RC.
VALUE LABELS Q_213_RC 1 "<10000" 2 "10000-15000" 3 "15000-20000" 4 "20000 and above".
EXECUTE.

SELECT IF (Q_213_RC ge 1).
FREQUENCIES VARIABLES=Q_213
  /NTILES=4
  /STATISTICS=STDDEV RANGE MEAN MEDIAN
  /ORDER=ANALYSIS.

FREQUENCIES Q_213_RC.
EXECUTE.

*Expenditure in health sector=========================================

FREQUENCIES Q_214.

RECODE Q_214 (0=SYSMIS) (1 thru 499=1) (500 thru 999 =2) (1000 thru high =3) into Q_214_RC.
VALUE LABELS Q_214_RC 1 "<500" 2 "500-1000" 3 "1000 and above".
EXECUTE.

SELECT IF (Q_214_RC ge 1).
FREQUENCIES VARIABLES=Q_214
  /NTILES=4
  /STATISTICS=STDDEV RANGE MEAN MEDIAN
  /ORDER=ANALYSIS.


FREQUENCIES Q_214_RC.
EXECUTE.


* Place of ANC =====================================================================================

FRE Q_403_A Q_403_B Q_403_C Q_403_D Q_403_E Q_403_F Q_403_G Q_403_H Q_403_I Q_403_J Q_403_K Q_403_L Q_403_M Q_403_X.

COMPUTE Q_403_Multiple=Q_403_A + Q_403_B + Q_403_C + Q_403_D + Q_403_E + Q_403_F + Q_403_G + Q_403_H + Q_403_I + Q_403_J + Q_403_K + Q_403_L + Q_403_X.
VARIABLE LABELS Q_403_Multiple "Multiple source of ANC".
EXECUTE .
FRE Q_403_Multiple.

TEMPORARY.
SELECT IF (Q_401=1).
CROSSTABS
  /TABLES= Q_403_Multiple BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


* ANC at Home  ================================================================

FREQUENCIES Q_404.
EXECUTE .

COMPUTE Q_403_L_X=Q_403_L + Q_403_M + Q_403_X.
EXECUTE .

FREQUENCIES Q_403_L_X.

TEMPORARY.
SELECT IF (Q_403_L_X GE 1).
FREQUENCIES Q_404.


* During delivery Services ==============================================



RECODE Q_501 (1 thru 4=1) (5 thru 6=2) (7 thru 10=3) (11=3) (12=2) (13 thru 14=4) into Q_501_RC_4.
VARIABLE LABELS  Q_501_RC_4 'What is the delivery place of your (Name of Youngest child) child?'.
VALUE LABELS Q_501_RC_4 1 "MCH/DH/MCHC/UHC" 2 "UHFWC/SC/RD/CC" 3 "NGOH/NGOPHC/PC/OC/GPS" 4 "Home". 

FREQUENCIES  Q_501_RC_4.


CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222 Q_222_RC Q_223_RC FOOD_SEC_RC BY Q_501_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

* Home delivery statistics

FRE Q_503_1 Q_503_2 Q_503_3 Q_503_96.

COMPUTE Q_503=0.
EXECUTE .

DO IF  (Q_503_1 = 1).
RECODE Q_503 (0=1).
END IF.
EXECUTE.


DO IF  (Q_503_2 = 1).
RECODE Q_503 (0=2).
END IF.
EXECUTE.


DO IF  (Q_503_3 = 1).
RECODE Q_503 (0=3).
END IF.
EXECUTE.


DO IF  (Q_503_96 = 1).
RECODE Q_503 (0=96).
END IF.
EXECUTE.

VARIABLE LABELS Q_503 "Home Delivary Types: Without Sysmiss".
VALUE LABELS Q_503 1 "CSBA/pCSBA/Nurse/Paramedics/FWV/Doctor" 2 "Village Doctor/TBA" 3 "Relatives/Friends" 4 "Others".
EXECUTE.

COMPUTE Q_503_Home=Q_503.
DO IF  (Q_501_M NE 1).
RECODE Q_503_Home (0=SYSMISS).
VARIABLE LABELS Q_503_Home "Home Delivary Types: With Sysmiss".
VALUE LABELS Q_503_Home 1 "CSBA/pCSBA/Nurse/Paramedics/FWV/Doctor" 2 "Village Doctor/TBA" 3 "Relatives/Friends" 4 "Others".
END IF.

FRE Q_501_M Q_503 Q_503_Home.

RECODE Q_503 (1=1) (2=2) (3=3) (96=3) into Q_503_RC.
VARIABLE LABELS Q_503_RC "Home Delivary Types".
VALUE LABELS Q_503_RC 1 "CSBA/pCSBA/Nurse/Paramedics/FWV/Doctor" 2 "Village Doctor/TBA" 3 "Relatives/Friends/Others".
EXECUTE .

FREQUENCIES Q_503_RC.

* Overall

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222 Q_222_RC Q_223_RC FOOD_SEC_RC BY Q_503_RC
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

* Within Home delivery 

RECODE Q_503_Home (1=1) (2=2) (3=3) (96=3) into Q_503_Home_RC.
VARIABLE LABELS Q_503_Home_RC "Home Delivary Types".
VALUE LABELS Q_503_Home_RC 1 "CSBA/pCSBA/Nurse/Paramedics/FWV/Doctor" 2 "Village Doctor/TBA" 3 "Relatives/Friends/Others".
EXECUTE .

FRE Q_503_Home_RC.

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222 Q_222_RC Q_223_RC FOOD_SEC_RC BY Q_503_Home_RC
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.



* 502 only for A-L ============================================================================

COMPUTE Q_502_NEW=Q_502.
EXECUTE .

FREQUENCIES Q_502.

DO IF  (Q_501_A = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_B = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_C = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_D = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_E = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_F = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.

DO IF  (Q_501_G = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_H = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.

DO IF  (Q_501_I = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.

DO IF  (Q_501_J = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_K = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_L = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=999).
END IF.
EXECUTE.


DO IF  (Q_501_M = 1 & Q_502 = 0).
RECODE Q_502_NEW (0=SYSMISS).
END IF.
EXECUTE.

VALUE LABELS Q_502_NEW 999 "Don't Know/Forget".
EXECUTE.

FREQUENCIES Q_502_NEW.


* After Delivery ===================================================================
* Postnatal Care ========================================

VARIABLE LABELS Q_504_Y "Did you or your child receive any sort of PNC checkup?". 
VALUE LABELS Q_504_Y 1 "Yes" 0 "No".
EXECUTE .
FRE Q_504_Y.

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222 Q_222_RC Q_223_RC FOOD_SEC_RC BY Q_504_Y
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

FRE Q_505.

COMPUTE Q_505_NEW=Q_505.
EXECUTE .

DO IF  (Q_504_Y=1 & Q_505=0).
RECODE Q_505_NEW (0=999).
END IF.
VALUE LABELS Q_505_NEW 999 "Immediately".
VARIABLE LABELS Q_505_NEW "how long after delivery you were checked up?".
EXECUTE.

DO IF  (Q_504_Y=0 & Q_505=0).
RECODE Q_505_NEW (0=SYSMISS).
END IF.

FRE Q_505 Q_505_NEW.



* How many got PNC withing 24 Hours  ========================================

RECODE Q_505_NEW (999=0) (1 thru 24=1) (else=2) into Q_505_24.
VARIABLE LABELS Q_505_24 "PNC withing 24 delivery?".
VALUE LABELS Q_505_24 0 "Within 1 Hour" 1 "1-24 Hours" 2 "None/More than 24 Hours".
EXECUTE .

FRE Q_505_NEW Q_505_24.

CROSSTABS
  /TABLES=Upazila BY Q_505_24
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


TEMPORARY.
SELECT IF (Q_505_24 LT 2).
CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222 Q_222_RC Q_223_RC FOOD_SEC_RC BY Q_505_24
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


* Place of PNC ==================================================

FRE Q_506_501 Q_506_503.

COMPUTE Q_506_503_NEW=Q_506_503.
EXECUTE.

DO IF  (Q_504_Y=0 & Q_506_503=0).
RECODE Q_506_503_NEW (0=SYSMISS).
END IF.

FRE Q_506_501 Q_506_503 Q_506_503_NEW.

* PNC From Medically Trained Service Provider

CROSSTABS Q_506_503_NEW by Q_506_501.

COMPUTE PNC_MTSP=1.
DO IF  (Q_506_501="M" & Q_506_503_NEW GT 1).
RECODE PNC_MTSP (1=0).
END IF.
VALUE LABELS PNC_MTSP 1 "PNC by MTSP" 0 "PNC by Others".
VARIABLE LABELS PNC_MTSP "PNC by Medically Trained Service Provider (MTSP)".
EXECUTE.

DO IF  (SYSMIS(Q_506_503_NEW)).
RECODE PNC_MTSP (1=0).
END IF.
EXECUTE.

DO IF  (Q_506_501="X" & Q_506_503_NEW GT 1).
RECODE PNC_MTSP (1=SYSMISS).
END IF.

FREQUENCIES PNC_MTSP.

CROSSTABS Q_506_501 Q_506_503_NEW by PNC_MTSP.

* PNC within 24 Hours ==============================================

COMPUTE PNC_24H=Q_505_24 LT 2.
VARIABLE LABELS PNC_24H "PNC within 24 hours".
VALUE LABELS PNC_24H 1 "Yes" 0 "No".
EXECUTE .

FREQUENCIES PNC_24H.

* PNC with 24 Hours by Medically Trained Service Provider 

CROSSTABS PNC_24H by PNC_MTSP.

COMPUTE PNC_24H_MTSP=(PNC_24H=1 & PNC_MTSP=1).
EXECUTE .

FREQUENCIES PNC_24H_MTSP.


* CAG Fund related work =============================================================================

FREQUENCIES Q_515_Y.

COMPUTE Q_515_Y_RC=Q_515_Y.
EXECUTE .

DO IF  (Q_514_Y=0).
RECODE Q_515_Y_RC (0=SYSMISS) .
END IF.
EXECUTE.

DO IF  (Q_514_Y=0).
RECODE Q_515_Y_RC (1=SYSMISS) .
END IF.
EXECUTE.

FREQUENCIES Q_514_Y Q_515_Y_RC.

* Q 17 * Q 18 ----------------------------------------------

DO IF  (Q_517_Y=0).
RECODE Q_518_1 (0=SYSMISS) .
END IF.
EXECUTE.

DO IF  (Q_517_Y=0).
RECODE Q_518_1 (1=SYSMISS) .
END IF.
EXECUTE.



DO IF  (Q_517_Y=0).
RECODE Q_518_2 (0=SYSMISS) .
END IF.
EXECUTE.

DO IF  (Q_517_Y=0).
RECODE Q_518_2 (1=SYSMISS) .
END IF.
EXECUTE.



DO IF  (Q_517_Y=0).
RECODE Q_518_3 (0=SYSMISS) .
END IF.
EXECUTE.

DO IF  (Q_517_Y=0).
RECODE Q_518_3 (1=SYSMISS) .
END IF.
EXECUTE.



* Number of ANC from Medically Trained Service Provider ==================================================================

FRE Q_402_MTSP Q_402_RC_1 Q_402_RC_3 Q_402_RC_4.

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222_RC Q_223_RC FOOD_SEC_RC BY Q_402_RC_1 Q_402_RC_3 Q_402_RC_4
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


* Facility Delivery ==================================================================

COMPUTE Facility_Delivery=Q_501_RC_4 LT 4.
VARIABLE LABELS Facility_Delivery "Delivery at Facility or Home".
VALUE LABELS Facility_Delivery 1 "At Facility" 0 "At Home".
EXECUTE .

FREQUENCIES Facility_Delivery.

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222_RC Q_223_RC FOOD_SEC_RC BY Facility_Delivery
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


* Skilled Birth Attended ========================================================================

COMPUTE SBA=0.
VARIABLE LABELS SBA "Delivery by a Skilled Birth Attended".
VALUE LABELS SBA 1 "Skilled Birth Attended" 0 "Unskilled Birth Attended".
EXECUTE .

DO IF  (Facility_Delivery = 1).
RECODE SBA (0=1).
END IF.
EXECUTE.

DO IF  (Q_503_Home_RC = 1).
RECODE SBA (0=1).
END IF.
EXECUTE.

FREQUENCIES SBA.

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222_RC Q_223_RC FOOD_SEC_RC BY SBA
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

* PNC within 24 Hours by Medically Trained Servie Provider ==============================================

CROSSTABS
  /TABLES=Upazila Q_102_RC Q_105_RC Q_106_RC Q_107_Main_RC Q_107_Main_RC_1 Q_110_RC Q_111_RC Q_114_RC
		Q_201_1 Q_206_RC Q_207 Q_208_RC Q_217_RC Q_222_RC Q_223_RC FOOD_SEC_RC BY PNC_24H_MTSP
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


COMPUTE Q_830_123=0.
EXECUTE .

DO IF (Q830=1).
RECODE Q_830_123 (0=1).
END IF.
EXECUTE.

DO IF  (Q837A$1 = 1).
RECODE Q_830_123 (0=2).
END IF.
EXECUTE.

DO IF  (Q837A$2 = 1).
RECODE Q_830_123 (0=3).
END IF.
EXECUTE.

VARIABLE LABELS Q_830_123 "diagnostic_capacity".
VALUE LABELS Q_830_123 1 "Blood Glucose" 2 "Urine Protine" 3 "Urine Glucose".
EXECUTE.













