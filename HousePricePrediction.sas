*-------------------------------------------------------------------------;
* Course	     : BIA652-B  Multivariate Data Analysis	(Fall 2017)	      ;
* Developers	 : MAULIK JAJAL (10421667)								  ;
* 				   MEGH VANKAWALA (10421684)							  ;
*				   RIMABEN PATEL (10422512)								  ;
* Comments       : FINAL PROJECT   										  ;
*-------------------------------------------------------------------------;

*-------------------------------------------------------------------------;
* Project Name		: House Price Prediction							  ;
*-------------------------------------------------------------------------;

title "Import CSV datafile to SAS Work Library";

proc import datafile="G:\Stevens Master\SEM-2\BIA-652\multivariate data analysis-SAS\RAW_data\house_price.csv"
     out=house_price
     dbms=csv
     replace;
     getnames=yes;
	 datarow=2;
run;

title	"Means Procedure to check for Missing Values";
proc means data=House_price NMISS N; 
run;

title "Transform Data for Regression";

data House_price2;
	set House_price;

		if 		MSZoning="C"  	then MSZoning_new = 0;
		else if MSZoning="FV"  	then MSZoning_new = 1;
		else if MSZoning="RH"  	then MSZoning_new = 2;
		else if MSZoning="RL"  	then MSZoning_new = 3;
		else MSZoning_new = 4;

		if LotFrontage="NA"		then LotFrontage_new = 0;
		else LotFrontage_new = LotFrontage;

		if Street = "Pave"			then Street_new = 0;
		else Street_new = 1;

		if Alley = "Pa"			then Alley_new = 1;
		else if Alley = "Gr"		then Alley_new = 2;
		else Alley_new = 0;

		if LotShape="IR1" then LotShape_new  = 3;
		else if LotShape = "IR2" then LotShape_new = 2;
		else if LotShape = "IR3" then LotShape_new = 1;
		else LotShape_new = 0;

		if LandContour = "Bnk" 			then LandContour_new = 0;
		else if LandContour = "HLS" 	then LandContour_new = 1;
		else if LandContour = "Low" 	then LandContour_new = 2;
		else  LandContour_new = 3;

		if Utilities = "AllPub"			then Utilities_new = 1;
		else Utilities_new = 0;

		if LotConfig = "Corner" 		then LotConfig_new = 0;
		else if LotConfig = "CulDSac" 	then LotConfig_new = 1;
		else if LotConfig = "FR2"		then LotConfig_new = 2;
		else if LotConfig = "FR3" 		then LotConfig_new = 3;
		else  LotConfig_new = 4;

		if LandSlope= "Gtl" 	 then LandSlope_new = 0;
		else if LandSlope= "Mod" then LandSlope_new = 1;
		else LandSlope_new = 2;

		if Neighborhood = "Blmngtn" 		then Neighborhood_new = 1;
		else if Neighborhood = "Blueste" 	then Neighborhood_new = 2;
		else if Neighborhood = "BrDale" 	then Neighborhood_new = 3;
		else if Neighborhood = "BrkSide" 	then Neighborhood_new = 4;
		else if Neighborhood = "ClearCr" 	then Neighborhood_new = 5;
		else if Neighborhood = "CollgCr" 	then Neighborhood_new = 6;
		else if Neighborhood = "Crawfor" 	then Neighborhood_new = 7;
		else if Neighborhood = "Edwards" 	then Neighborhood_new = 8;
		else if Neighborhood = "Gilbert" 	then Neighborhood_new = 9;
		else if Neighborhood = "IDOTRR" 	then Neighborhood_new = 10;
		else if Neighborhood = "MeadowV" 	then Neighborhood_new = 11;
		else if Neighborhood = "Mitchel" 	then Neighborhood_new = 12;
		else if Neighborhood = "NAmes" 		then Neighborhood_new = 13;
		else if Neighborhood = "NoRidge" 	then Neighborhood_new = 14;
		else if Neighborhood = "NPkVill" 	then Neighborhood_new = 15;
		else if Neighborhood = "NPkVill" 	then Neighborhood_new = 16;
		else if Neighborhood = "NWAmes"		then Neighborhood_new = 17;
		else if Neighborhood = "OldTown" 	then Neighborhood_new = 18;
		else if Neighborhood = "Sawyer" 	then Neighborhood_new = 19;
		else if Neighborhood = "SawyerW" 	then Neighborhood_new = 20;
		else if Neighborhood = "Somerst" 	then Neighborhood_new = 21;
		else if Neighborhood = "StoneBr" 	then Neighborhood_new = 22;
		else if Neighborhood = "SWISU" 		then Neighborhood_new = 23;
		else if Neighborhood = "Timber" 	then Neighborhood_new = 25;
		else  	Neighborhood_new = 0;

		if Condition1="Norm" 		then Condition1_new = 0;
		else if Condition1="Artery" then Condition1_new = 1;
		else if Condition1="Feedr" 	then Condition1_new = 2;
		else if Condition1="PosA" 	then Condition1_new = 3;
		else if Condition1="PosN" 	then Condition1_new = 4;
		else if Condition1="RRAe" 	then Condition1_new = 5;
		else if Condition1="RRAn" 	then Condition1_new = 6;
		else if Condition1="RRNe" 	then Condition1_new = 7;
		else 	Condition1_new = 8;

		if Condition2="Norm" 		then Condition2_new = 0;
		else if Condition2="Artery" then Condition2_new = 1;
		else if Condition2="Feedr" 	then Condition2_new = 2;
		else if Condition2="PosA" 	then Condition2_new = 3;
		else if Condition2="PosN" 	then Condition2_new = 4;
		else if Condition2="RRAe" 	then Condition2_new = 5;
		else if Condition2="RRAn" 	then Condition2_new = 6;
		else if Condition2="RRNe" 	then Condition2_new = 7;
		else 	Condition2_new = 8;

		if BldgType="1Fam" 			then BldgType_new = 0;
		else if BldgType="2fmCon" 	then BldgType_new = 1;
		else if BldgType="Duplex" 	then BldgType_new = 2;
		else if BldgType="Twnhs" 	then BldgType_new = 3;
		else  BldgType_new = 4;

		if HouseStyle="1.5Fin" 		then HouseStyle_new = 0;
		else if HouseStyle="1.5Unf" then HouseStyle_new = 1;
		else if HouseStyle="1Story" then HouseStyle_new = 2;
		else if HouseStyle="2.5Fin" then HouseStyle_new = 3;
		else if HouseStyle="2.5Unf" then HouseStyle_new = 4;
		else if HouseStyle="2Story" then HouseStyle_new = 5;
		else if HouseStyle="SFoyer" then HouseStyle_new = 6;
		else  HouseStyle_new = 7;

		if RoofStyle="Flat" 		then RoofStyle_new = 0;
		else if RoofStyle="Gable" 	then RoofStyle_new = 1;
		else if RoofStyle="Gambrel" then RoofStyle_new = 2;
		else if RoofStyle="Hip" 	then RoofStyle_new = 3;
		else if RoofStyle="Mansard" then RoofStyle_new = 4;
		else RoofStyle_new = 5;

		if RoofMatl="CompShg" 		then RoofMatl_new = 1;
		else if RoofMatl="Metal" 	then RoofMatl_new = 2;
		else if RoofMatl="WdShngl" 	then RoofMatl_new = 3;
		else if RoofMatl="WdShake" 	then RoofMatl_new = 4;
		else if RoofMatl="ClyTile" 	then RoofMatl_new = 5;
		else if RoofMatl="Roll" 	then RoofMatl_new = 6;
		else if RoofMatl="Membran" 	then RoofMatl_new = 7;
		else  RoofMatl_new = 0;

		if Exterior1st="AsbShng" 		then Exterior1st_new = 1;
		else if Exterior1st="AsphShn" 	then Exterior1st_new = 2;
		else if Exterior1st="BrkComm" 	then Exterior1st_new = 3;
		else if Exterior1st="BrkFace" 	then Exterior1st_new = 4;
		else if Exterior1st="CBlock" 	then Exterior1st_new = 5;
		else if Exterior1st="CemntBd" 	then Exterior1st_new = 6;
		else if Exterior1st="HdBoard" 	then Exterior1st_new = 7;
		else if Exterior1st="ImStucc" 	then Exterior1st_new = 8;
		else if Exterior1st="MetalSd" 	then Exterior1st_new = 9;
		else if Exterior1st="Plywood" 	then Exterior1st_new = 10;
		else if Exterior1st="Stone" 	then Exterior1st_new = 11;
		else if Exterior1st="Stucco" 	then Exterior1st_new = 12;
		else if Exterior1st="VinylSd" 	then Exterior1st_new = 13;
		else if Exterior1st="Wd Sdng" 	then Exterior1st_new = 14;
		else Exterior1st_new = 0;

		if Exterior2nd="AsbShng" 		then Exterior2nd_new = 1;
		else if Exterior2nd="AsphShn" 	then Exterior2nd_new = 2;
		else if Exterior2nd="BrkComm" 	then Exterior2nd_new = 3;
		else if Exterior2nd="BrkFace" 	then Exterior2nd_new = 4;
		else if Exterior2nd="CBlock" 	then Exterior2nd_new = 5;
		else if Exterior2nd="CemntBd" 	then Exterior2nd_new = 6;
		else if Exterior2nd="HdBoard" 	then Exterior2nd_new = 7;
		else if Exterior2nd="ImStucc" 	then Exterior2nd_new = 8;
		else if Exterior2nd="MetalSd" 	then Exterior2nd_new = 9;
		else if Exterior2nd="Plywood" 	then Exterior2nd_new = 10;
		else if Exterior2nd="Stone" 	then Exterior2nd_new = 11;
		else if Exterior2nd="Stucco" 	then Exterior2nd_new = 12;
		else if Exterior2nd="VinylSd" 	then Exterior2nd_new = 13;
		else if Exterior2nd="Wd Sdng" 	then Exterior2nd_new = 14;
		else Exterior2nd_new = 0;

		if MasVnrType="NA" 			then MasVnrType_new = 0;
		else if MasVnrType="BrkCmn" then MasVnrType_new = 1;
		else if MasVnrType="BrkFace" then MasVnrType_new = 2;
		else if MasVnrType="Stone" 	then MasVnrType_new = 3;
		else MasVnrType_new = 4;

		if ExterQual="Ex" 		then ExterQual_new = 6;
		else if ExterQual="Gd" 	then ExterQual_new = 5;
		else if ExterQual="TA" 	then ExterQual_new = 4;
		else if ExterQual="Av" 	then ExterQual_new = 4;
		else if ExterQual="Fa" 	then ExterQual_new = 3;
		else if ExterQual="Po" 	then ExterQual_new = 2;
		else if ExterQual="No" 	then ExterQual_new = 1;
		else if ExterQual="NA" 	then ExterQual_new = 0;

		if ExterCond="Ex" 		then ExterCond_new = 6;
		else if ExterCond="Gd" 	then ExterCond_new = 5;
		else if ExterCond="TA" 	then ExterCond_new = 4;
		else if ExterCond="Av" 	then ExterCond_new = 4;
		else if ExterCond="Fa" 	then ExterCond_new = 3;
		else if ExterCond="Po" 	then ExterCond_new = 2;
		else if ExterCond="No" 	then ExterCond_new = 1;
		else if ExterCond="NA" 	then ExterCond_new = 0;

		if Foundation="BrkTil" then Foundation_new= 1;
		else if Foundation="CBlock" then Foundation_new= 2;
		else if Foundation="PConc" then Foundation_new= 3;
		else if Foundation="Slab" then Foundation_new= 4;
		else if Foundation="Stone" then Foundation_new= 5;
		else Foundation_new= 0;

		if BsmtQual="Ex" 		then BsmtQual_new = 6;
		else if BsmtQual="Gd" 	then BsmtQual_new = 5;
		else if BsmtQual="TA" 	then BsmtQual_new = 4;
		else if BsmtQual="Av" 	then BsmtQual_new = 4;
		else if BsmtQual="Fa" 	then BsmtQual_new = 3;
		else if BsmtQual="Po" 	then BsmtQual_new = 2;
		else if BsmtQual="No" 	then BsmtQual_new = 1;
		else if BsmtQual="NA" 	then BsmtQual_new = 0;

		if BsmtCond="Ex" 		then BsmtCond_new = 6;
		else if BsmtCond="Gd" 	then BsmtCond_new = 5;
		else if BsmtCond="TA" 	then BsmtCond_new = 4;
		else if BsmtCond="Av" 	then BsmtCond_new = 4;
		else if BsmtCond="Fa" 	then BsmtCond_new = 3;
		else if BsmtCond="Po" 	then BsmtCond_new = 2;
		else if BsmtCond="No" 	then BsmtCond_new = 1;
		else if BsmtCond="NA" 	then BsmtCond_new = 0;

		if BsmtExposure="Ex" 		then BsmtExposure_new = 6;
		else if BsmtExposure="Gd" 	then BsmtExposure_new = 5;
		else if BsmtExposure="TA" 	then BsmtExposure_new = 4;
		else if BsmtExposure="Av" 	then BsmtExposure_new = 4;
		else if BsmtExposure="Fa" 	then BsmtExposure_new = 3;
		else if BsmtExposure="Mn" 	then BsmtExposure_new = 2;
		else if BsmtExposure="No" 	then BsmtExposure_new = 1;
		else if BsmtExposure="NA" 	then BsmtExposure_new = 0;

		if BsmtFinType1="ALQ" then BsmtFinType1_new = 5;
		else if BsmtFinType1="BLQ" then BsmtFinType1_new = 4;
		else if BsmtFinType1="GLQ" then BsmtFinType1_new = 6;
		else if BsmtFinType1="LwQ" then BsmtFinType1_new = 2;
		else if BsmtFinType1="NA" then BsmtFinType1_new = 0;
		else if BsmtFinType1="Rec" then BsmtFinType1_new = 3;
		else if BsmtFinType1="Unf" then BsmtFinType1_new = 1;
		

		if BsmtFinType2="ALQ" then BsmtFinType2_new = 5;
		else if BsmtFinType2="BLQ" then BsmtFinType2_new = 4;
		else if BsmtFinType2="GLQ" then BsmtFinType2_new = 6;
		else if BsmtFinType2="LwQ" then BsmtFinType2_new = 2;
		else if BsmtFinType2="NA" then BsmtFinType2_new = 0 ;
		else if BsmtFinType2="Rec" then BsmtFinType2_new = 3;
		else if BsmtFinType2="Unf" then BsmtFinType2_new = 1;


		if Heating="Floor" then Heating_new = 1;
		else if Heating="GasA" then Heating_new = 2;
		else if Heating="GasW" then Heating_new = 3;
		else if Heating="Grav" then Heating_new = 4;
		else if Heating="OthW" then Heating_new = 5;
		else  Heating_new = 0;
		
		if HeatingQC="Ex" 		then HeatingQC_new = 6;
		else if HeatingQC="Gd" 	then HeatingQC_new = 5;
		else if HeatingQC="TA" 	then HeatingQC_new = 4;
		else if HeatingQC="Av" 	then HeatingQC_new = 4;
		else if HeatingQC="Fa" 	then HeatingQC_new = 3;
		else if HeatingQC="Po" 	then HeatingQC_new = 2;
		else if HeatingQC="No" 	then HeatingQC_new = 1;
		else if HeatingQC="NA" 	then HeatingQC_new = 0;

		
		if CentralAir = "Y" then CentralAir_new = 1;
		else CentralAir_new = 0;

		if Electrical = "FuseA" then Electrical_new = 1;
		else if Electrical = "FuseF" then Electrical_new = 2;
		else if Electrical = "FuseP" then Electrical_new = 3;
		else if Electrical = "Mix" then Electrical_new = 4;
		else if Electrical = "NA" then Electrical_new = 5;
		else Electrical_new = 0;

		if KitchenQual="Ex" 		then KitchenQual_new = 6;
		else if KitchenQual="Gd" 	then KitchenQual_new = 5;
		else if KitchenQual="TA" 	then KitchenQual_new = 4;
		else if KitchenQual="Av" 	then KitchenQual_new = 4;
		else if KitchenQual="Fa" 	then KitchenQual_new = 3;
		else if KitchenQual="Po" 	then KitchenQual_new = 2;
		else if KitchenQual="No" 	then KitchenQual_new = 1;
		else if KitchenQual="NA" 	then KitchenQual_new = 0;


		if Functional="Maj1" then Functional_new = 2;
		else if Functional="Maj2" then Functional_new = 1;
		else if Functional="Min1" then Functional_new = 5;
		else if Functional="Min2" then Functional_new = 4;
		else if Functional="Mod" then Functional_new =3;
		else if Functional="Sev" then Functional_new = 0;
		else if Functional="Typ" then Functional_new = 6;

		if FireplaceQu="Ex" 		then FireplaceQu_new = 6;
		else if FireplaceQu="Gd" 	then FireplaceQu_new = 5;
		else if FireplaceQu="TA" 	then FireplaceQu_new = 4;
		else if FireplaceQu="Av" 	then FireplaceQu_new = 4;
		else if FireplaceQu="Fa" 	then FireplaceQu_new = 3;
		else if FireplaceQu="Po" 	then FireplaceQu_new = 2;
		else if FireplaceQu="No" 	then FireplaceQu_new = 1;
		else if FireplaceQu="NA" 	then FireplaceQu_new = 0;


		if GarageType="Attchd" then GarageType_new = 5;
		else if GarageType="2Types" then GarageType_new = 6;
		else if GarageType="Basment" then GarageType_new = 4;
		else if GarageType="BuiltIn" then GarageType_new = 3;
		else if GarageType="CarPort" then GarageType_new = 2;
		else if GarageType="Detchd" then GarageType_new = 1;
		else  GarageType_new = 0;

		if GarageFinish="RFn" then GarageFinish_new = 2;
		else if GarageFinish="Fin" then GarageFinish_new = 3;
		else if GarageFinish="Unf" then GarageFinish_new = 1;
		else GarageFinish_new = 0;	

		if GarageQual="Ex" 		then GarageQual_new = 6;
		else if GarageQual="Gd" 	then GarageQual_new = 5;
		else if GarageQual="TA" 	then GarageQual_new = 4;
		else if GarageQual="Av" 	then GarageQual_new = 4;
		else if GarageQual="Fa" 	then GarageQual_new = 3;
		else if GarageQual="Po" 	then GarageQual_new = 2;
		else if GarageQual="No" 	then GarageQual_new = 1;
		else if GarageQual="NA" 	then GarageQual_new = 0;

		if GarageCond="Ex" 		then GarageCond_new = 6;
		else if GarageCond="Gd" 	then GarageCond_new = 5;
		else if GarageCond="TA" 	then GarageCond_new = 4;
		else if GarageCond="Av" 	then GarageCond_new = 4;
		else if GarageCond="Fa" 	then GarageCond_new = 3;
		else if GarageCond="Po" 	then GarageCond_new = 2;
		else if GarageCond="No" 	then GarageCond_new = 1;
		else if GarageCond="NA" 	then GarageCond_new = 0;
		
		if PavedDrive = "Y" then PavedDrive_new = 1;
		else if PavedDrive = "N" then PavedDrive_new = 0;
		else PavedDrive_new = 2;

		if PoolQC="Ex" 		then PoolQC_new = 6;
		else if PoolQC="Gd" 	then PoolQC_new = 5;
		else if PoolQC="TA" 	then PoolQC_new = 4;
		else if PoolQC="Av" 	then PoolQC_new = 4;
		else if PoolQC="Fa" 	then PoolQC_new = 3;
		else if PoolQC="Po" 	then PoolQC_new = 2;
		else if PoolQC="No" 	then PoolQC_new = 1;
		else if PoolQC="NA" 	then PoolQC_new = 0;

		if Fence="GdPrv" then Fence_new = 4;
		else if Fence="GdWo" then Fence_new = 3;
		else if Fence="MnPrv" then Fence_new = 2;
		else if Fence="MnWw" then Fence_new = 1;
		else if Fence="NA" then Fence_new = 0;

		if MiscFeature="NA" then MiscFeature_new = 0;
		else if MiscFeature="Gar2" then MiscFeature_new = 3;
		else if MiscFeature="Othr" then MiscFeature_new = 1;
		else if MiscFeature="Shed" then MiscFeature_new = 2;
		else if MiscFeature="TenC" then MiscFeature_new = 4;

	
		if SaleType="COD" then SaleType_new = 1;
		else if SaleType="Con" then SaleType_new = 2;
		else if SaleType="ConLD" then SaleType_new = 3;
		else if SaleType="ConLI" then SaleType_new = 4;
		else if SaleType="ConLw" then SaleType_new = 5;
		else if SaleType="CWD" then SaleType_new = 6;
		else if SaleType="New" then SaleType_new = 7;
		else if SaleType="Oth" then SaleType_new = 8;
		else SaleType_new = 0;

		if SaleCondition = "Abnorml" then SaleCondition_new = 1;
		else if SaleCondition = "AdjLand" then SaleCondition_new = 2;
		else if SaleCondition = "Alloca" then SaleCondition_new = 3;
		else if SaleCondition = "Family" then SaleCondition_new = 4;
		else if SaleCondition = "Normal" then SaleCondition_new = 5;
		else SaleCondition_new = 0;

		if MasVnrArea="" then MasVnrArea = 0;
		if GarageYrBlt="" then GarageYrBlt = 0;

run;

title	"Means Procedure to check for Missing Values";
proc means data=House_price2 NMISS N; 
run;


*Histogram of Target Variable: SalePrice;

proc sgplot data=House_price2;
title "SalePrice";
histogram SalePrice ;
density SalePrice;
density SalePrice / type=kernel;
run;

*HBox plot for SalePrice Vs PoolQuality;

proc sgplot data=House_price2;
hbox SalePrice / category= OverallQual;
run;

*Plot for SalePrice Vs Pool Quality;

proc sgplot data=House_price2;
title "PoolQC_new vs SalePrice";
yaxis label="SalePrice";
xaxis label="PoolQC_new" Values=(0 to 6 by 1) ;
vbar PoolQC_new / response=SalePrice stat=mean; 
run;

* Plot for SalePrice Vs GarageCars;

proc sgplot data=House_price2;
title "GarageCars vs SalePrice";
yaxis label="SalePrice" ;
xaxis label="GarageCars" ;
vbar GarageCars / response=SalePrice stat=mean; 
run;

* Plot for Year_built Vs Overall_Quality;

proc sgplot data=House_price2;
title "YearBuilt Vs OverallQual";
xaxis label= "YearBuilt" Values=(1870 to 2010 by 10);
yaxis label="OverallQual"Values=(0 to 10 by 1);
vbar   YearBuilt/ response=OverallQual stat=mean; 
run;

*Univariate procedure on GarageCars variable;

proc univariate data=House_price2 modes;
title "Univariate Analysis on GarageCars";
var GarageCars ;
run;

*Univariate procedure on OverallQual variable;

proc univariate data=House_price2 modes;
title "Univariate Analysis on OverallQual";
var OverallQual ;
run;

*Univariate procedure on GrLivArea variable;

proc univariate data=House_price2 modes;
title "Q-Q Plot GrLivArea";
var GrLivArea;
probplot GrLivArea/ normal (mu=est sigma=est);
inset mean std;
run;



title	"Correlation Analysis for some variables"

proc corr data=House_price2  cov;
var 	Utilities_new	OverallQual		OverallCond		YearBuilt						
		GarageYrBlt		GarageCars		GarageQual_new	WoodDeckSF		
		SaleType_new	SaleCondition_new	GrLivArea;
run;

*regression analysis;
* stepwise model;

title "Regression Analysis with stepwise selection with All Variables";

proc reg data=House_price2;
	model 	SalePrice =		
			MSSubClass		MSZoning_new	LotFrontage_new	LotArea				Alley_new
			Street_new		LotShape_new	LandContour_new	Utilities_new		LotConfig_new
			LandSlope_new	Neighborhood_new Condition1_new	Condition2_new		BldgType_new
			HouseStyle_new	OverallQual		OverallCond		YearBuilt			YearRemodAdd	
			RoofStyle_new	RoofMatl_new	Exterior1st_new	Exterior2nd_new		MasVnrType_new	
			MasVnrArea		ExterQual_new	ExterCond_new	Foundation_new		BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new BsmtFinSF1		BsmtFinType2_new
			BsmtFinSF2		BsmtUnfSF		Heating_new		HeatingQC_new		CentralAir_new
			Electrical_new	_1stFlrSF		_2ndFlrSF		LowQualFinSF		BsmtFullBath
			BsmtHalfBath	FullBath		HalfBath		BedroomAbvGr		KitchenAbvGr
			KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			FireplaceQu_new
			GarageType_new	GarageYrBlt		GarageFinish_new GarageCars			GarageArea
			GarageQual_new	GarageCond_new	PavedDrive_new	WoodDeckSF			OpenPorchSF
			EnclosedPorch	_3SsnPorch		ScreenPorch		PoolArea			PoolQC_new
			MiscVal			MoSold			YrSold			SaleType_new		SaleCondition_new	
			Fence_new		MiscFeature_new TotalBsmtSF		GrLivArea		
	/   stb     VIF ss1 ss2 selection=stepwise slentry=0.1 slstay=0.1;
	OUTPUT OUT = reg_House_price PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
      
quit;

* select all variable from above stepwise and run type MAXR;
title "regression analysis on variable selected from Stepwise with MAXR selection";
proc reg data=House_price2
plots(label)=all;
	model 	SalePrice =		
			MSSubClass		LotFrontage_new	LotArea				Alley_new
			Utilities_new	Neighborhood_new Condition1_new	Condition2_new		OverallQual		
			OverallCond		YearBuilt		RoofStyle_new	RoofMatl_new	Exterior1st_new			MasVnrType_new	
			MasVnrArea		ExterQual_new	BsmtQual_new	BsmtCond_new	BsmtExposure_new 
			BsmtFinType1_new Electrical_new	BsmtFullBath	SaleCondition_new	GrLivArea
			BedroomAbvGr	KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			
			GarageYrBlt		GarageCars		GarageQual_new	WoodDeckSF			ScreenPorch		
			SaleType_new	
			
	/   stb     VIF ss1 ss2 selection=MAXR;
	OUTPUT OUT = reg_House_price2 PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
quit;

* remove "LotFrontage_new", "Alley_new", "Neighborhood_new ", "YearRemodAdd","Exterior1st_new","Exterior2nd_new",
"BsmtFinSF1", "Electrical_new","KitchenAbvGr" as it's F-value is higher than 0.05;
* Select only significant variable from above MAXR and run MAXR again;

title "Regression Model after removing non-significant variables";
proc reg data=House_price2
plots(label)=all;
	model 	SalePrice =		
			MSSubClass		LotArea		Utilities_new	 Condition1_new	Condition2_new		
			OverallQual		OverallCond		YearBuilt	RoofStyle_new	RoofMatl_new	Exterior1st_new								
			MasVnrType_new	MasVnrArea		ExterQual_new	BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new 		BsmtFullBath
			BedroomAbvGr	KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			
			GarageYrBlt		GarageCars		GarageQual_new	WoodDeckSF			
			ScreenPorch		SaleType_new	SaleCondition_new	GrLivArea
	/   stb     VIF ss1 ss2;
	OUTPUT OUT = reg_House_price3 PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
      
quit;

*In addition to the correlation matrix,  "GarageYrBlt-0.8428" and "GarageQual_new = 8422" have the highest variance inflation (17.78235 & 17.51713) indicating a severe multicollinearity. 
One of the MPG variables should be removed from the model. GrLivArea;

proc reg data=House_price2
plots(label)= all;
	model 	SalePrice =		MSSubClass		LotArea		Condition1_new	Condition2_new		
			OverallQual		OverallCond		YearBuilt	RoofStyle_new	RoofMatl_new	Exterior1st_new								
			MasVnrType_new	MasVnrArea		ExterQual_new	BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new 	BsmtFullBath
			BedroomAbvGr	KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			
			GarageYrBlt		GarageCars		WoodDeckSF	ScreenPorch		SaleType_new	
			SaleCondition_new	GrLivArea
			 /   stb     VIF ss1 ss2;
	OUTPUT OUT = reg_House_price4 PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
      
quit;

*remove totrmsabvgrd as its varience inflation is high;

title "Final Regression Analysis";
proc reg data=House_price2
plots(label)=all;
	model 	SalePrice =		MSSubClass		LotArea		Condition1_new	Condition2_new		
			OverallQual		OverallCond		YearBuilt	RoofStyle_new	RoofMatl_new	Exterior1st_new								
			MasVnrType_new	MasVnrArea		ExterQual_new	BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new 	BsmtFullBath
			BedroomAbvGr	KitchenQual_new		Functional_new	Fireplaces			
			GarageYrBlt		GarageCars		WoodDeckSF	ScreenPorch		SaleType_new	
			SaleCondition_new	GrLivArea
			
			 /   stb     VIF ss1 ss2;
	OUTPUT OUT = reg_House_price5 PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
      
quit;

/*Normalized all 79 variables to perform PCA on them*/

title "Normalize all Predictor varibles for PCA";

proc standard data=House_price2 mean =0 std=1 
out = House_priceZ;
var MSSubClass		MSZoning_new	LotFrontage_new	LotArea				Alley_new
			Street_new		LotShape_new	LandContour_new	Utilities_new		LotConfig_new
			LandSlope_new	Neighborhood_new Condition1_new	Condition2_new		BldgType_new
			HouseStyle_new	OverallQual		OverallCond		YearBuilt			YearRemodAdd	
			RoofStyle_new	RoofMatl_new	Exterior1st_new	Exterior2nd_new		MasVnrType_new	
			MasVnrArea		ExterQual_new	ExterCond_new	Foundation_new		BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new BsmtFinSF1		BsmtFinType2_new
			BsmtFinSF2		BsmtUnfSF		Heating_new		HeatingQC_new		CentralAir_new
			Electrical_new	_1stFlrSF		_2ndFlrSF		LowQualFinSF		BsmtFullBath
			BsmtHalfBath	FullBath		HalfBath		BedroomAbvGr		KitchenAbvGr
			KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			FireplaceQu_new
			GarageType_new	GarageYrBlt		GarageFinish_new GarageCars			GarageArea
			GarageQual_new	GarageCond_new	PavedDrive_new	WoodDeckSF			OpenPorchSF
			EnclosedPorch	_3SsnPorch		ScreenPorch		PoolArea			PoolQC_new
			MiscVal			MoSold			YrSold			SaleType_new		SaleCondition_new	
			Fence_new		MiscFeature_new TotalBsmtSF		GrLivArea;
run;

title "Summary of Normalized Data";

proc means data=House_priceZ;
var MSSubClass		MSZoning_new	LotFrontage_new	LotArea				Alley_new
			Street_new		LotShape_new	LandContour_new	Utilities_new		LotConfig_new
			LandSlope_new	Neighborhood_new Condition1_new	Condition2_new		BldgType_new
			HouseStyle_new	OverallQual		OverallCond		YearBuilt			YearRemodAdd	
			RoofStyle_new	RoofMatl_new	Exterior1st_new	Exterior2nd_new		MasVnrType_new	
			MasVnrArea		ExterQual_new	ExterCond_new	Foundation_new		BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new BsmtFinSF1		BsmtFinType2_new
			BsmtFinSF2		BsmtUnfSF		Heating_new		HeatingQC_new		CentralAir_new
			Electrical_new	_1stFlrSF		_2ndFlrSF		LowQualFinSF		BsmtFullBath
			BsmtHalfBath	FullBath		HalfBath		BedroomAbvGr		KitchenAbvGr
			KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			FireplaceQu_new
			GarageType_new	GarageYrBlt		GarageFinish_new GarageCars			GarageArea
			GarageQual_new	GarageCond_new	PavedDrive_new	WoodDeckSF			OpenPorchSF
			EnclosedPorch	_3SsnPorch		ScreenPorch		PoolArea			PoolQC_new
			MiscVal			MoSold			YrSold			SaleType_new		SaleCondition_new	
			Fence_new		MiscFeature_new TotalBsmtSF		GrLivArea	;
run;

title "PCA Anlysis for all Normalized Variables";

proc princomp data=House_priceZ 
plots=all;
var MSSubClass		MSZoning_new	LotFrontage_new	LotArea				Alley_new
			Street_new		LotShape_new	LandContour_new	Utilities_new		LotConfig_new
			LandSlope_new	Neighborhood_new Condition1_new	Condition2_new		BldgType_new
			HouseStyle_new	OverallQual		OverallCond		YearBuilt			YearRemodAdd	
			RoofStyle_new	RoofMatl_new	Exterior1st_new	Exterior2nd_new		MasVnrType_new	
			MasVnrArea		ExterQual_new	ExterCond_new	Foundation_new		BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new BsmtFinSF1		BsmtFinType2_new
			BsmtFinSF2		BsmtUnfSF		Heating_new		HeatingQC_new		CentralAir_new
			Electrical_new	_1stFlrSF		_2ndFlrSF		LowQualFinSF		BsmtFullBath
			BsmtHalfBath	FullBath		HalfBath		BedroomAbvGr		KitchenAbvGr
			KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			FireplaceQu_new
			GarageType_new	GarageYrBlt		GarageFinish_new GarageCars			GarageArea
			GarageQual_new	GarageCond_new	PavedDrive_new	WoodDeckSF			OpenPorchSF
			EnclosedPorch	_3SsnPorch		ScreenPorch		PoolArea			PoolQC_new
			MiscVal			MoSold			YrSold			SaleType_new		SaleCondition_new	
			Fence_new		MiscFeature_new TotalBsmtSF		GrLivArea			;
run;

/*Only 1-25 Prin Comp Eigonvalue > 1*/

title "PCA Anlysis for 25 components with all normalized Variables";

proc princomp data=House_priceZ 
n=25
plots=all
out=pca_House_price;
var 		MSSubClass		MSZoning_new	LotFrontage_new	LotArea				Alley_new
			Street_new		LotShape_new	LandContour_new	Utilities_new		LotConfig_new
			LandSlope_new	Neighborhood_new Condition1_new	Condition2_new		BldgType_new
			HouseStyle_new	OverallQual		OverallCond		YearBuilt			YearRemodAdd	
			RoofStyle_new	RoofMatl_new	Exterior1st_new	Exterior2nd_new		MasVnrType_new	
			MasVnrArea		ExterQual_new	ExterCond_new	Foundation_new		BsmtQual_new
			BsmtCond_new	BsmtExposure_new BsmtFinType1_new BsmtFinSF1		BsmtFinType2_new
			BsmtFinSF2		BsmtUnfSF		Heating_new		HeatingQC_new		CentralAir_new
			Electrical_new	_1stFlrSF		_2ndFlrSF		LowQualFinSF		BsmtFullBath
			BsmtHalfBath	FullBath		HalfBath		BedroomAbvGr		KitchenAbvGr
			KitchenQual_new	TotRmsAbvGrd	Functional_new	Fireplaces			FireplaceQu_new
			GarageType_new	GarageYrBlt		GarageFinish_new GarageCars			GarageArea
			GarageQual_new	GarageCond_new	PavedDrive_new	WoodDeckSF			OpenPorchSF
			EnclosedPorch	_3SsnPorch		ScreenPorch		PoolArea			PoolQC_new
			MiscVal			MoSold			YrSold			SaleType_new		SaleCondition_new	
			Fence_new		MiscFeature_new TotalBsmtSF		GrLivArea 			;
run;


title "Multiple Linear Regression Anlysis on PCA";

proc reg data=pca_House_price outest=est_House_price2 plots=all;
	model 	SalePrice =	Prin1 - Prin25
	/   stb dwProb pcorr1 VIF ss1 ss2 selection=MAXR;
    OUTPUT OUT = reg_pca_House_price1 PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
quit;

title "Multiple Regression Anlysis on PCA with significant variables";

proc reg data=pca_House_price outest=est_House_price3 plots(label)=all;
	model 	SalePrice =	Prin1 - Prin4 Prin6 - Prin9
						Prin11 Prin13 Prin14 Prin16 Prin19 
						Prin20 Prin22 Prin23

	/   stb dwProb pcorr1 VIF ss1 ss2;
	OUTPUT OUT = reg_pca_House_price2 PREDICTED=PRCDT RESIDUAL = h_Res
	L95M = h_l95m U95M  = h_u95m L95 =h_l95 U95 = h_u95 
	rstudent = h_rstudent h = lev cookd = Cookd dffits = dffit 
	STDP = h_spredicted STDR = h_s_residual STUDENT = h_student;
      
quit;

