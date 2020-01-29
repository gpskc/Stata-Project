clear all
set more off
use "C:\Users\pcg180000\Documents\BUAN 6312.004\Project\guns.dta",clear
xtset stateid year

gen lnvio = ln(vio)
reg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029
estat imtest, white
reg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, vce(robust)
reg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, vce(cluster stateid)

xtreg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, fe
estimates store fe_vio
xtreg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, re
estimates store re_vio
hausman fe_vio re_vio

xtreg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, fe cluster(stateid)
xtreg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, re cluster(stateid)
xtreg lnvio i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029 i.year, fe cluster(stateid)
testparm i.year

gen lnrob = ln(rob)
reg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029
estat imtest, white
reg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, vce(robust)
reg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, vce(cluster stateid)

xtreg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, fe
estimates store fe_rob
xtreg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, re
estimates store re_rob
hausman fe_rob re_rob

xtreg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, fe cluster(stateid)
xtreg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, re cluster(stateid)
xtreg lnrob i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029 i.year, fe cluster(stateid)
testparm i.year

gen lnmur = ln(mur)
reg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029
estat imtest, white
reg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, vce(robust)
reg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, vce(cluster stateid)

xtreg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, fe
estimates store fe_mur
xtreg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, re
estimates store re_mur
hausman fe_mur re_mur

xtreg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, fe cluster(stateid)
xtreg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029, re cluster(stateid)
xtreg lnmur i.shall incarc_rate avginc density pop pb1064 pw1064 pm1029 i.year, fe cluster(stateid)
testparm i.year
