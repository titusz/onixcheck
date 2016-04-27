<?xml version="1.0" encoding="UTF-8"?>
<!--

	**************************************************
	WORK IN PROGRESS VERSION ONLY
	**************************************************
	*                                                *
	*               ONIX INTERNATIONAL               *
	*     BOOK PRODUCT INFORMATION MESSAGE SCHEMA    *
	*                                                *
	*                                                *
	*                   SCHEMATRON                   *
	*              REFERENCE TAG VERSION             *
	*                                                *
	*               Author: Graham Bell              *
	*                                                *
	*                                                *
	*                 Release 3.0.1                  *
	*                  Version 0.5                   *
	*               Status: DEVELOPMENT              *
	*            Release date: 2012-10-04            *
	*              Revised: 2014-05-17               *
	*                                                *
	*               (c) 2013-4 EDItEUR               *
	*             http://www.editeur.org/            *
	*                                                *
	**************************************************


	TERMS AND CONDITIONS OF USE OF THE ONIX BOOK PRODUCT INFORMATION MESSAGE SCHEMA

	All ONIX standards and documentation are copyright materials, made available
	free of charge for general use. If you use any version of the ONIX Book Product
	Information Message Schema, you will be deemed to have accepted these terms and
	conditions:

	1. You agree that you will not add to, delete from or amend any version of the 
	ONIX Product Information Message Schema, or any part of the Schema except for 
	strictly internal use within your own organisation.

	2. You agree that if you wish to add to, amend, or make extracts of any version 
	of the Schema for any purpose that is not strictly internal to your own organisation, 
	you will in the first instance notify EDItEUR and allow EDItEUR to review 
	and comment on your proposed use, in the interest of securing an orderly 
	development of the Schema for the benefit of other users.

	If you do not accept these terms, you must not use any version of the ONIX Product 
	Information Message Schema. A full licence 

	Full copies of all published versions of the latest release of this Schema and all 
	associated documentation are available from the EDItEUR web site, where may also be 
	found details of how to contact EDItEUR for advice on the use of this Schema. The URL 
	for the EDItEUR web site is:

	http://www.editeur.org/

-->

<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
	<ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<ns prefix="onix" uri="http://ns.editeur.org/onix/3.0/reference"/>

	<title>EDItEUR ONIX 3.0 Schematron</title>
	<p>Validates an ONIX instance document against various documented requirements and
		co-occurrence constraints that are not checked in the ONIX XSD or RNG schemas.</p>
	<p>The Schematron:</p>
	<p>• checks second-order dependencies on codelists eg list 79 and list 196</p>
	<p>• checks for repetition of identifiers, typed composites and plain elements</p>
	<p>• checks for required language attributes on multilingual text elements</p>
	<p>• checks identifier check digits</p>
	<p>• checks other microsyntaxes eg in ProductFormFeature, FSC COC numbers, BIC, BISAC, CLIL, and Thema code structures</p>
	<p>• checks namespaces on proprietary identifiers</p>
	<p>• checks dates are valid</p>
	<p>• warns when string lengths are longer than recommended</p>
	<p>• checks embedded markup matches textformat attributes</p>
	<p>• when integers or reals are beyond the recommended maximum or minimum values</p>
	<p>• warns when deprecated elements or codelist values are used</p>
	<p>• warns when unnecessary whitespace is included in data elements</p>
	<p>• relies on the presence of the XSD schema to read values from the codelists</p>

	<let name="codelists_path" value="'ONIX_BookProduct_CodeLists.xsd'"/>
	<let name="bic_codelist_path" value="'BIC_SubjectCategory_Codelists.xsd'"/>
	<let name="bisac_codelist_path" value="'BISAC_SubjectCategory_Codelists.xsd'"/>
	<let name="clil_codelist_path" value="'CLIL_SubjectCategory_Codelists.xsd'"/>
	<let name="thema_codelist_path" value="'Thema_SubjectCategory_Codelists.xsd'"/>

	<let name="list28" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List28']/xs:restriction/xs:enumeration/@value"/>
	<let name="list66" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List66']/xs:restriction/xs:enumeration/@value"/>
	<let name="list76" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List76']/xs:restriction/xs:enumeration/@value"/>
	<let name="list77" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List77']/xs:restriction/xs:enumeration/@value"/>
	<let name="list98" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List98']/xs:restriction/xs:enumeration/@value"/>
	<let name="list99" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List99']/xs:restriction/xs:enumeration/@value"/>
	<let name="list139" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List139']/xs:restriction/xs:enumeration/@value"/>
	<let name="list143" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List143']/xs:restriction/xs:enumeration/@value"/>
	<let name="list176" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List176']/xs:restriction/xs:enumeration/@value"/>
	<let name="list184" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List184']/xs:restriction/xs:enumeration/@value"/>
	<let name="list196" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List196']/xs:restriction/xs:enumeration/@value"/>
	<let name="list203" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List203']/xs:restriction/xs:enumeration/@value"/>
	<let name="list204" value="doc($codelists_path)/xs:schema/xs:simpleType[@name = 'List204']/xs:restriction/xs:enumeration/@value"/>
	<let name="listBic2.0" value="doc($bic_codelist_path)/xs:schema/xs:simpleType[@name = 'ListBic2.0']/xs:restriction/xs:enumeration/@value"/>
	<let name="listBic2.1" value="doc($bic_codelist_path)/xs:schema/xs:simpleType[@name = 'ListBic2.1']/xs:restriction/xs:enumeration/@value"/>
	<let name="listBisac2009" value="doc($bisac_codelist_path)/xs:schema/xs:simpleType[@name = 'ListBisac2009']/xs:restriction/xs:enumeration/@value"/>
	<let name="listBisac2010" value="doc($bisac_codelist_path)/xs:schema/xs:simpleType[@name = 'ListBisac2010']/xs:restriction/xs:enumeration/@value"/>
	<let name="listBisac2011" value="doc($bisac_codelist_path)/xs:schema/xs:simpleType[@name = 'ListBisac2011']/xs:restriction/xs:enumeration/@value"/>
	<let name="listBisac2012" value="doc($bisac_codelist_path)/xs:schema/xs:simpleType[@name = 'ListBisac2012']/xs:restriction/xs:enumeration/@value"/>
	<let name="listClil2010" value="doc($clil_codelist_path)/xs:schema/xs:simpleType[@name = 'ListClil2010']/xs:restriction/xs:enumeration/@value"/>
	<let name="listClil2013" value="doc($clil_codelist_path)/xs:schema/xs:simpleType[@name = 'ListClil2013']/xs:restriction/xs:enumeration/@value"/>
	<let name="listThema0.9" value="doc($thema_codelist_path)/xs:schema/xs:simpleType[@name = 'List_Thema_1.1']/xs:restriction/xs:enumeration/@value"/>

	<pattern id="message">
		<rule context="/onix:ONIXMessage">
			<report role="warn" test="count(onix:Product) gt 1">
				There are <value-of select="count(onix:Product)"/> Product records in the message.
			</report>
			<report role="warn" test="count(onix:Product) eq 1">
				There is one Product record in the message.
			</report>
		</rule>
	</pattern>

	<pattern id="check_number_ranges">
		<!-- integers -->
		<rule id="_1037" context="//onix:MapScale"><let name="min" value="1"/><let name="max" value="99999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:SequenceNumber"><let name="min" value="1"/><let name="max" value="999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:ConferenceNumber"><let name="min" value="1"/><let name="max" value="9999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:EditionNumber"><let name="min" value="1"/><let name="max" value="9999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:NumberOfIllustrations"><let name="min" value="0"/><let name="max" value="999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:Number"><let name="min" value="0"/><let name="max" value="999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:PositionOnList"><let name="min" value="1"/><let name="max" value="999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:NumberOfPages"><let name="min" value="1"/><let name="max" value="999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:LatestReprintNumber"><let name="min" value="1"/><let name="max" value="999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:OnHand"><let name="min" value="0"/><let name="max" value="9999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:OnOrder"><let name="min" value="0"/><let name="max" value="9999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:CBO"><let name="min" value="0"/><let name="max" value="9999999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:PackQuantity"><let name="min" value="1"/><let name="max" value="9999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:MinimumOrderQuantity"><let name="min" value="1"/><let name="max" value="9999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:BatchQuantity"><let name="min" value="1"/><let name="max" value="9999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<rule context="//onix:FreeQuantity"><let name="min" value="0"/><let name="max" value="9999"/><extends rule="abstract_check_integer_bounds"/></rule>
		<!-- reals -->
		<rule id="_1038" context="//onix:Quantity"><let name="min" value="0"/><let name="max" value="999999999999"/><let name="dp" value="2"/><extends rule="abstract_check_real_bounds"/></rule><!-- quantity dp set to allow percentage such as 32.25% -->
		<rule id="_1039" context="//onix:Measurement"><let name="min" value="0.125"/><let name="max" value="999999"/><let name="dp" value="3"/><extends rule="abstract_check_real_bounds"/></rule><!-- measurement dp set to allow 8ths but not 16ths -->
		<rule context="//onix:DiscountPercent"><let name="min" value="0"/><let name="max" value="100"/><let name="dp" value="2"/><extends rule="abstract_check_real_bounds"/></rule><!-- discount percent dp set to allow percentage such as 32.25% -->
		<!-- money -->
		<rule context="//onix:DiscountAmount"><let name="min" value="0.01"/><let name="max" value="999999999999"/><extends rule="abstract_check_money_bounds"/></rule>
		<rule context="//onix:PriceAmount"><let name="min" value="0.01"/><let name="max" value="999999999999"/><extends rule="abstract_check_money_bounds"/></rule>
		<rule context="//onix:TaxableAmount"><let name="min" value="0.01"/><let name="max" value="999999999999"/><extends rule="abstract_check_money_bounds"/></rule>
		<rule context="//onix:TaxAmount"><let name="min" value="0.00"/><let name="max" value="999999999999"/><extends rule="abstract_check_money_bounds"/></rule>
		<rule abstract="true" id="abstract_check_number_bounds">
			<assert role="warn" test="number() ge $min" diagnostics="diagnostic_recordreference">
				The value of <name/> is too small.
			</assert>
			<assert role="warn" test="number() le $max" diagnostics="diagnostic_recordreference">
				The value of <name/> is too large.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_integer_bounds">
			<extends rule="abstract_check_number_bounds"/>
		</rule>
		<rule abstract="true" id="abstract_check_real_bounds">
			<assert role="warn" test="number() lt $min or number() gt $max or string-length(substring-after(normalize-space(), '.')) le $dp" diagnostics="diagnostic_recordreference">
				The value of <name/> is too precise.
			</assert>
			<extends rule="abstract_check_number_bounds"/>
		</rule>
		<rule abstract="true" id="abstract_check_money_bounds">
			<assert role="warn" test="number() lt $min or number() gt $max or string-length(substring-after(normalize-space(),'.')) = 2 or string-length(substring-after(normalize-space(),'.')) = 0" diagnostics="diagnostic_recordreference">
				The precision of <name/> is inappropriate – it is usual to quote money values to 2 decimal places, or (for some currencies) as an integer.
			</assert>
			<extends rule="abstract_check_number_bounds"/>
		</rule>
	</pattern>

	<pattern id="check_string_lengths">
		<!-- max number of digits 6 (inc decimal point) -->
		<rule id="_1041" context="//onix:Measurement"><let name="maxlen" value="6"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:DiscountPercent"><let name="maxlen" value="6"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 10 -->
		<rule context="//onix:SubjectSchemeVersion"><let name="maxlen" value="10"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:AudienceRangeValue"><let name="maxlen" value="10"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max number of digits 12 (inc decimal point) -->
		<rule id="_1040" context="//onix:Quantity"><let name="maxlen" value="12"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:DiscountAmount"><let name="maxlen" value="12"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PriceAmount"><let name="maxlen" value="12"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TaxableAmount"><let name="maxlen" value="12"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TaxAmount"><let name="maxlen" value="12"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 20 -->
		<rule context="//onix:PartNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:YearOfAnnual"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TitlePrefix"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ConferenceAcronym"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:EditionVersionNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SubjectCode"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ComplexityCode"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:FirstPageNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:LastPageNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ComponentTypeName"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ComponentNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TelephoneNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:FaxNumber"><let name="maxlen" value="20"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 50 -->
		<rule context="//@sourcename"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//@collationkey"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule id="_1012" context="//onix:IDTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SenderName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:AddresseeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SourceName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CollectionSequenceTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:AudienceCodeTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CityOfPublication"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ProductContactName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ReturnsCodeTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:StockQuantityCodeTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:DiscountCodeTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PriceCodeTypeName"><let name="maxlen" value="50"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 100 -->
		<rule context="//onix:EmailAddress"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule id="_1001" context="//onix:RecordReference"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule id="_1006" context="//onix:DeletionText"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule id="_1016" context="//onix:RecordSourceName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CollectionSequenceNumber"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PersonName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PersonNameInverted"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TitlesBeforeNames"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:NamesBeforeKey"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PrefixToKey"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:KeyNames"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:NamesAfterKey"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SuffixToKey"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:LettersAfterNames"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TitlesAfterNames"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ProfessionalPosition"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ConferencePlace"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:EditionStatement"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:AncillaryContentDescription"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SubjectSchemeName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ListName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PrizeName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:LevelSequenceNumber"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ImprintName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PublisherName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:RegionsIncluded"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:RegionsExcluded"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:AgentName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SupplierName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:LocationName"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 200 -->
		<rule id="_1047" context="//onix:ProductFormDescription"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CorporateName"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CorporateNameInverted"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:Affiliation"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ContributorDescription"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ConferenceName"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ConferenceTheme"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:IllustrationsNote"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TextSourceCorporate"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SalesOutletName"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:InitialPrintRun"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ReprintDetail"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CopiesSold"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:BookClubAdoption"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PriceTypeDescription"><let name="maxlen" value="200"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 250 -->
		<rule context="//onix:SubjectHeadingText"><let name="maxlen" value="250"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 300 -->
		<rule context="//onix:ContactName"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TitleText"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TitleWithoutPrefix"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:Subtitle"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ThesisPresentedTo"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:WebsiteDescription"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:WebsiteLink"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:TextAuthor"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SourceTitle"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CitationNote"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:FeatureNote"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PublishingStatusNote"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:SalesRestrictionNote"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:MarketPublishingStatusNote"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PromotionContact"><let name="maxlen" value="300"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 500 -->
		<rule context="//onix:MessageNote"><let name="maxlen" value="500"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule id="_1052" context="//onix:ProductFormFeatureDescription"><let name="maxlen" value="500"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PrizeJury"><let name="maxlen" value="500"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ReissueDescription"><let name="maxlen" value="500"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 600 -->
		<rule context="//onix:CountriesIncluded"><let name="maxlen" value="600"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CountriesExcluded"><let name="maxlen" value="600"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- max length 1000 -->
		<rule context="//onix:TitleStatement"><let name="maxlen" value="1000"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ContributorStatement"><let name="maxlen" value="1000"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:AudienceDescription"><let name="maxlen" value="1000"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:PromotionCampaign"><let name="maxlen" value="1000"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- no max length -->
		<rule context="//onix:BiographicalNote"><let name="maxlen" value="10000"/><extends rule="abstract_lib_unchecked_string_length"/></rule>
		<rule context="//onix:Text"><let name="maxlen" value="10000"/><extends rule="abstract_lib_unchecked_string_length"/></rule>
	</pattern>

	<pattern id="check_text_formats">
		<rule context="//onix:TitleStatement[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:TitleStatement[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:TitleStatement[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:TitleStatement[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:BiographicalNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:BiographicalNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:BiographicalNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:BiographicalNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:ContributorDescription[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:ContributorDescription[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:ContributorDescription[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:ContributorDescription[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:ContributorStatement[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:ContributorStatement[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:ContributorStatement[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:ContributorStatement[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:WebsiteDescription[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:WebsiteDescription[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:WebsiteDescription[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:WebsiteDescription[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:ConferenceTheme[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:ConferenceTheme[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:ConferenceTheme[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:ConferenceTheme[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:IllustrationsNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:IllustrationsNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:IllustrationsNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:IllustrationsNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:AncillaryContentDescription[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:AncillaryContentDescription[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:AncillaryContentDescription[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:AncillaryContentDescription[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:AudienceDescription[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:AudienceDescription[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:AudienceDescription[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:AudienceDescription[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:Text[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:Text[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:Text[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:Text[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:CitationNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:CitationNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:CitationNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:CitationNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:FeatureNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:FeatureNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:FeatureNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:FeatureNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:PrizeJury[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:PrizeJury[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:PrizeJury[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:PrizeJury[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:PublishingStatusNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:PublishingStatusNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:PublishingStatusNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:PublishingStatusNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:SalesRestrictionNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:SalesRestrictionNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:SalesRestrictionNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:SalesRestrictionNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:MarketPublishingStatusNote[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:MarketPublishingStatusNote[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:MarketPublishingStatusNote[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:MarketPublishingStatusNote[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:PromotionCampaign[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:PromotionCampaign[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:PromotionCampaign[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:PromotionCampaign[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:PromotionContact[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:PromotionContact[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:PromotionContact[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:PromotionContact[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:InitialPrintRun[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:InitialPrintRun[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:InitialPrintRun[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:InitialPrintRun[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:ReprintDetail[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:ReprintDetail[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:ReprintDetail[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:ReprintDetail[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:CopiesSold[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:CopiesSold[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:CopiesSold[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:CopiesSold[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:BookClubAdoption[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:BookClubAdoption[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:BookClubAdoption[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:BookClubAdoption[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<rule context="//onix:ReissueDescription[@textformat = '02']"><extends rule="abstract_check_for_HTML"/></rule>
		<rule context="//onix:ReissueDescription[@textformat = '03']"><extends rule="abstract_check_for_XML"/></rule>
		<rule context="//onix:ReissueDescription[@textformat = '05']"><extends rule="abstract_check_for_XHTML"/></rule>
		<rule context="//onix:ReissueDescription[@textformat = '07']"><extends rule="abstract_check_for_ASCII"/></rule>
		<!-- default is textformat = 06 -->
		<rule context="//onix:TitleStatement"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:BiographicalNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:ContributorDescription"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:ContributorStatement"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:WebsiteDescription"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:ConferenceTheme"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:IllustrationsNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:AncillaryContentDescription"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:AudienceDescription"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:Text"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:CitationNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:FeatureNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:PrizeJury"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:PublishingStatusNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:SalesRestrictionNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:MarketPublishingStatusNote"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:PromotionCampaign"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:PromotionContact"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:InitialPrintRun"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:ReprintDetail"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:CopiesSold"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:BookClubAdoption"><extends rule="abstract_check_for_text"/></rule>
		<rule context="//onix:ReissueDescription"><extends rule="abstract_check_for_text"/></rule>
		<rule abstract="true" id="abstract_check_for_XHTML">
			<extends rule="abstract_check_for_escaped_markup_in_XHTML"/>
			<extends rule="abstract_check_for_recommended_XHTML_subset"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_HTML">
			<extends rule="abstract_check_for_markup"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_XML">
			<extends rule="abstract_check_for_markup"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_ASCII">
			<assert role="error" test="not(matches(., '\P{IsBasicLatin}'))" diagnostics="diagnostic_recordreference">
				<name/> contains non-Ascii text and must not have textformat attribute 07.
			</assert>
			<extends rule="abstract_check_for_text"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_text">
			<extends rule="abstract_check_for_markup"/>
			<extends rule="abstract_check_for_escaped_markup"/>
			<extends rule="abstract_check_for_internal_linebreak_or_tab"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_markup">
			<assert role="error" test="not(child::element())" diagnostics="diagnostic_recordreference">
				<name/> contains markup, and should use textformat attribute 05 (XHTML).
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_for_escaped_markup">
			<assert role="error" test="not(matches(., '&lt;/?\w+ */? *&gt;'))" diagnostics="diagnostic_recordreference">
				<name/> contains escaped markup, and should not have textformat attribute 06 or 07.
			</assert>
			<extends rule="abstract_check_for_double_escaped_markup"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_escaped_markup_in_XHTML">
			<assert role="warn" test="not(matches(., '&lt;/?\w+ */? *&gt;'))" diagnostics="diagnostic_recordreference">
				<name/> contains escaped markup, which should probably not be escaped.
			</assert>
			<extends rule="abstract_check_for_double_escaped_markup"/>
		</rule>
		<rule abstract="true" id="abstract_check_for_double_escaped_markup">
			<assert role="warn" test="not(matches(., '&amp;lt;/?\w+ */? *(&amp;gt;|&gt;)'))" diagnostics="diagnostic_recordreference">
				<name/> contains double-escaped markup, which should probably not be double-escaped.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_for_internal_linebreak_or_tab">
			<assert role="warn" test="not(matches(., '\S(\n|\r|\t|\p{Zl}|\p{Zp})+\S'))" diagnostics="diagnostic_recordreference">
				Line breaks or tabs within <name/> will almost certainly be ignored by the recipient.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_for_recommended_XHTML_subset">
			<assert role="warn" test="count(descendant::*) = count(descendant::*[matches(local-name(), '^(p|br|i|b|em|strong|ul|ol|li|ruby|rb|rp|rt)$')])" diagnostics="diagnostic_recordreference">
				<name/> contains XHTML elements outside the recommended minimal set (p, br, i, b, em, strong, ul, ol, li, ruby, rb, rp and rt).
			</assert>
		</rule>
	</pattern>

	<pattern id="check_repetition_of_identifiers">
		<rule context="//onix:SenderIdentifier[matches(onix:SenderIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:SenderIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:AddresseeIdentifier[matches(onix:AddresseeIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:AddresseeIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule id="_1007" context="//onix:RecordSourceIdentifier[matches(onix:RecordSourceIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule id="_1008" context="//onix:RecordSourceIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule id="_1017" context="//onix:ProductIdentifier[onix:ProductIDType = '01']"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers"/></rule>
		<rule id="_1018" context="//onix:ProductIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:CollectionIdentifier[onix:CollectionIDType = '01']"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers"/></rule>
		<rule context="//onix:CollectionIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:NameIdentifier[matches(onix:NameIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:NameIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier[matches(onix:ConferenceSponsorIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:TextItemIdentifier[onix:TextItemIDType = '01']"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers"/></rule>
		<rule context="//onix:TextItemIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:ImprintIdentifier[matches(onix:ImprintIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:ImprintIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:PublisherIdentifier[matches(onix:PublisherIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:PublisherIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:ProductContactIdentifier[matches(onix:ProductContactIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:ProductContactIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier[matches(onix:CopyrightOwnerIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:SalesOutletIdentifier[onix:SalesOutletIDType = '01']"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers"/></rule>
		<rule context="//onix:SalesOutletIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:WorkIdentifier[onix:WorkIDType = '01']"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers"/></rule>
		<rule context="//onix:WorkIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:AgentIdentifier[matches(onix:AgentIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:AgentIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:SupplierIdentifier[matches(onix:SupplierIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:SupplierIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule context="//onix:LocationIdentifier[matches(onix:LocationIDType, '01|02')]"><extends rule="abstract_check_different_type_from_preceding_proprietary_identifiers_02"/></rule>
		<rule context="//onix:LocationIdentifier"><extends rule="abstract_check_different_type_from_preceding_identifiers"/></rule>
		<rule abstract="true" id="abstract_check_different_type_from_preceding_identifiers">
			<assert role="error" test="not(preceding-sibling::*[name() = name(current()) and child::*[1] = current()/child::*[1]]/normalize-space(onix:IDValue) = normalize-space(onix:IDValue))" diagnostics="diagnostic_recordreference">
				<name/> specifies two identical identifiers.
			</assert>
			<assert role="warn" test="not(preceding-sibling::*[name() = name(current()) and child::*[1] = current()/child::*[1]]/normalize-space(onix:IDValue) != normalize-space(onix:IDValue))" diagnostics="diagnostic_recordreference">
				<name/> specifies two different identifiers of the same type.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_different_type_from_preceding_proprietary_identifiers">
			<assert role="error" test="not(preceding-sibling::*[name() = name(current()) and child::*[1] = '01' and normalize-space(onix:IDTypeName) = current()/normalize-space(onix:IDTypeName)]/normalize-space(onix:IDValue) = normalize-space(onix:IDValue))" diagnostics="diagnostic_recordreference">
				<name/> specifies two identical proprietary identifiers.
			</assert>
			<assert role="warn" test="not(preceding-sibling::*[name() = name(current()) and child::*[1] = '01' and normalize-space(onix:IDTypeName) = current()/normalize-space(onix:IDTypeName)]/normalize-space(onix:IDValue) != normalize-space(onix:IDValue))" diagnostics="diagnostic_recordreference">
				<name/> specifies two different identifiers of the same proprietary type.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_different_type_from_preceding_proprietary_identifiers_02">
			<assert role="error" test="not(preceding-sibling::*[name() = name(current()) and matches(child::*[1], '01|02') and normalize-space(onix:IDTypeName) = current()/normalize-space(onix:IDTypeName)]/normalize-space(onix:IDValue) = normalize-space(onix:IDValue))" diagnostics="diagnostic_recordreference">
				<name/> specifies two identical proprietary identifiers.
			</assert>
			<assert role="warn" test="not(preceding-sibling::*[name() = name(current()) and matches(child::*[1], '01|02') and normalize-space(onix:IDTypeName) = current()/normalize-space(onix:IDTypeName)]/normalize-space(onix:IDValue) != normalize-space(onix:IDValue))" diagnostics="diagnostic_recordreference">
				<name/> specifies two different identifiers of the same proprietary type.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_repetition_of_multiply_typed_composites">
		<!-- typed by type and audience and date -->
		<!-- rule context="//onix:TextContent[matches(onix:TextType, '02|03|04|05|12|13|15')]"><extends rule="abstract_check_repetition_of_double_typed_composite"/></rule -->
		<!-- rule context="//onix:CitedContent"><extends rule="abstract_check_repetition_of_double_typed_composite"/></rule --><!-- all possible values are repeatable -->
		<!-- rule context="//onix:SupportingResource"><extends rule="abstract_check_repetition_of_double_typed_composite"/></rule--><!-- all possible values are repeatable -->
		<!-- Prize by name and year -->
		<!-- Price is a multiply-typed composite by price type, country, currency, pricecondition, date -->
		<!-- CopyRightStatement is a multiply-typed composite by year and copyrightowner -->
		<!-- Tax by tax type and tax rate code or tax rate percent (difficult because all are optional)-->
	</pattern>

	<pattern id="check_repetition_of_typed_composites">
		<rule id="_1000" context="//onix:Product"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule id="_1030" context="//onix:Barcode[onix:BarcodeType = '00']"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule id="_1031" context="//onix:Barcode"><extends rule="abstract_check_repetition_of_double_typed_composite"/></rule>
		<rule id="_1048" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '01|02|03|04|05|10|30|31|32|33|34|35|36|37|40')]"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule id="_1049" context="//onix:Measure"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:EpubUsageConstraint"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ProductClassification"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:CollectionSequence[matches(onix:CollectionSequenceType, '02|03|04|05')]"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:TitleDetail[matches(onix:TitleType, '01|02|03')]"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:AlternativeName[onix:NameType = '04']"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ContributorDate"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ContributorPlace[matches(onix:ContributorPlaceRelator, '01|02|04|08')]"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ReligiousTextFeature"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<!-- rule context="//onix:Language"><extends rule="abstract_check_repetition_of_typed_composite"/></rule --><!-- all possible values are repeatable -->
		<rule context="//onix:Extent"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:AncillaryContent"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:NameAsSubject[onix:NameType = '04']"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:AudienceCode[matches(onix:AudienceCodeType, '03|04|05|19|20|23|24')]"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:AudienceRange"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:Complexity"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ContentDate"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ResourceFeature"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ResourceVersionFeature"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ContentItem"><extends rule="abstract_check_repetition_of_typed_composite"/></rule><!-- checks for duplicate level sequence number -->
		<!-- rule context="//onix:Publisher"><extends rule="abstract_check_repetition_of_typed_composite"/></rule --><!-- all possible values are repeatable -->
		<!-- rule context="//onix:Website"><extends rule="abstract_check_repetition_of_typed_composite"/></rule --><!-- all possible values are repeatable -->
		<!-- rule context="//onix:ProductContact"><extends rule="abstract_check_repetition_of_typed_composite"/></rule --><!-- all possible values are repeatable -->
		<rule context="//onix:CopyrightStatement"><extends rule="abstract_check_repetition_of_typed_composite"/></rule><!-- checks for duplicate copyright years -->
		<rule context="//onix:SalesRights"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:SalesRestriction"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<!-- rule context="//onix:RelatedWork"><extends rule="abstract_check_repetition_of_typed_composite"/></rule --><!-- all possible values are repeatable -->
		<!-- rule context="//onix:RelatedProduct"><extends rule="abstract_check_repetition_of_typed_composite"/></rule --><!-- all possible values are (at least arguably) repeatable -->
		<rule context="//onix:PublisherRepresentative[onix:AgentRole = '05']"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:MarketDate"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:Supplier[matches(onix:SupplierRole, '02|10')]"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:SupplierOwnCoding"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:ReturnsConditions"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:PriceCondition"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:PriceConditionQuantity"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:DiscountCoded"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:PriceDate"><extends rule="abstract_check_repetition_of_typed_composite"/></rule>
		<rule context="//onix:SupplyDate"><extends rule="abstract_check_repetition_of_typed_composite"/></rule><!-- also cannot combine role 24 with 14 or 15 -->
		<rule abstract="true" id="abstract_check_repetition_of_typed_composite">
			<assert role="error" test="not(preceding-sibling::*[name() = name(current())]/child::*[1] = child::*[1])" diagnostics="diagnostic_recordreference">
				<name/> composite duplicates a previous <name/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_repetition_of_double_typed_composite">
			<assert role="error" test="not(preceding-sibling::*[name() = name(current()) and child::*[1] = current()/child::*[1]]/child::*[2] = child::*[2])" diagnostics="diagnostic_recordreference">
				<name /> composite duplicates a previous <name/>.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_language_attributes_on_repeating_text_elements">
		<rule context="//onix:MessageNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule id="_1005" context="//onix:DeletionText"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule id="_1051" context="//onix:ProductFormFeatureDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule id="_1050" context="//onix:ProductFormDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:BiographicalNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:ContributorDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:ProfessionalPosition"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:WebsiteDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:ContributorStatement"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:EditionStatement"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:ReligiousTextFeatureDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:IllustrationsNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:AncillaryContentDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:SubjectHeadingText"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:AudienceDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:Text"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:FeatureNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:CitationNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:PrizeJury"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:PublishingStatusNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:SalesRestrictionNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:MarketPublishingStatusNote"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:ReprintDetail"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule context="//onix:PriceTypeDescription"><extends rule="abstract_check_language_attributes_on_repeating_text_element"/></rule>
		<rule abstract="true" id="abstract_check_language_attributes_on_repeating_text_element">
			<let name="nodename" value="local-name()"/>
			<assert role="error" test="@language or not(preceding-sibling::element()[local-name() = $nodename]) and not(following-sibling::element()[local-name() = $nodename])" diagnostics="diagnostic_recordreference">
				Each repeat of <name/> must have a language attribute.
			</assert>
			<assert role="error" test="not(@language) or (every $language in preceding-sibling::element()[local-name() = $nodename]/@language satisfies $language != @language)" diagnostics="diagnostic_recordreference">
				Each repeat of <name/> must have a unique language attribute.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_repetition_of_properties">
		<rule id="_1043" context="onix:ProductFormDetail"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule id="_1044" context="onix:ProductContentType"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule id="_1046" context="onix:EpubTechnicalProtection"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule id="_1045" context="onix:MapScale"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:ContributorRole"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:FromLanguage"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:ToLanguage"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:EditionType"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:BibleContents"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:BibleVersion"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:BiblePurpose"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:BibleTextFeature"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:ContentAudience"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:ResourceLink"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:CityOfPublication"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:TelephoneNumber"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:FaxNumber"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule context="onix:EmailAddress"><extends rule="abstract_check_repetition_of_property"/></rule>
		<rule abstract="true" id="abstract_check_repetition_of_property">
			<assert role="error" test="not(preceding-sibling::*[(name() = name(current())) and (. = current())])" diagnostics="diagnostic_recordreference">
				<name/> duplicates a previous <name/> element.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_identifier_formats">
		<!-- list 44 -->
		<rule context="//onix:SenderIdentifier[onix:SenderIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:SenderIdentifier[onix:SenderIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:SenderIdentifier[onix:SenderIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//onix:AddresseeIdentifier[onix:AddresseeIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:AddresseeIdentifier[onix:AddresseeIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:AddresseeIdentifier[onix:AddresseeIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule id="_1013" context="//onix:RecordSourceIdentifier[onix:RecordSourceIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule id="_1014" context="//onix:RecordSourceIdentifier[onix:RecordSourceIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule id="_1015" context="//onix:RecordSourceIdentifier[onix:RecordSourceIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<!-- list 5 -->
		<rule id="_1021" context="//onix:ProductIdentifier[onix:ProductIDType = '02']/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-10"/></rule>
		<rule id="_1022" context="//onix:ProductIdentifier[onix:ProductIDType = '03']/onix:IDValue"><extends rule="abstract_check_identifier_format_gtin-13"/></rule>
		<rule id="_1023" context="//onix:ProductIdentifier[onix:ProductIDType = '04']/onix:IDValue"><extends rule="abstract_check_identifier_format_gtin-12"/></rule>
		<rule id="_1024" context="//onix:ProductIdentifier[onix:ProductIDType = '05']/onix:IDValue"><extends rule="abstract_check_identifier_format_ismn-10"/></rule>
		<rule id="_1025" context="//onix:ProductIdentifier[onix:ProductIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_doi"/></rule>
		<rule id="_1026" context="//onix:ProductIdentifier[onix:ProductIDType = '14']/onix:IDValue"><extends rule="abstract_check_identifier_format_gtin-14"/></rule>
		<rule id="_1027" context="//onix:ProductIdentifier[matches(onix:ProductIDType, '15|24')]/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-13"/></rule>
		<rule id="_1028" context="//onix:ProductIdentifier[onix:ProductIDType = '25']/onix:IDValue"><extends rule="abstract_check_identifier_format_ismn-13"/></rule>
		<rule id="_1029" context="//onix:ProductIdentifier[onix:ProductIDType = '26']/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-a"/></rule>
		<!-- list 13 -->
		<rule context="//onix:CollectionIdentifier[onix:CollectionIDType = '02']/onix:IDValue"><extends rule="abstract_check_identifier_format_issn-8"/></rule>
		<rule context="//onix:CollectionIdentifier[onix:CollectionIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_doi"/></rule>
		<rule context="//onix:CollectionIdentifier[onix:CollectionIDType = '15']/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-13"/></rule>
		<!-- list 44 again -->
		<rule context="//onix:NameIdentifier[onix:NameIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:NameIdentifier[onix:NameIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:NameIdentifier[onix:NameIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//onix:NameIdentifier[onix:NameIDType = '21']/onix:IDValue"><extends rule="abstract_check_identifier_format_orcid"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier[onix:ConferenceSponsorIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier[onix:ConferenceSponsorIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier[onix:ConferenceSponsorIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<!-- list 43 -->
		<rule context="//onix:TextItemIdentifier[onix:TextItemIDType = '03']/onix:IDValue"><extends rule="abstract_check_identifier_format_gtin-13"/></rule>
		<rule context="//onix:TextItemIdentifier[onix:TextItemIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_doi"/></rule>
		<rule context="//onix:TextItemIdentifier[onix:TextItemIDType = '15']/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-13"/></rule>
		<!-- list 44 again -->
		<rule context="//onix:ImprintIdentifier[onix:ImprintIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:ImprintIdentifier[onix:ImprintIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:ImprintIdentifier[onix:ImprintIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//onix:PublisherIdentifier[onix:PublisherIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:PublisherIdentifier[onix:PublisherIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:PublisherIdentifier[onix:PublisherIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//onix:ProductContactIdentifier[onix:ProductContactIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:ProductContactIdentifier[onix:ProductContactIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:ProductContactIdentifier[onix:ProductContactIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//onix:ProductContactIdentifier[onix:ProductContactIDType = '21']/onix:IDValue"><extends rule="abstract_check_identifier_format_orcid"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier[onix:CopyrightOwnerIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier[onix:CopyrightOwnerIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier[onix:CopyrightOwnerIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier[onix:CopyrightOwnerIDType = '21']/onix:IDValue"><extends rule="abstract_check_identifier_format_orcid"/></rule>
		<!-- list 139 -->
		<rule context="//onix:SalesOutletIdentifier[onix:SalesOutletIDType = '03']/onix:IDValue"><extends rule="abstract_check_identifier_format_list139"/></rule>
		<!-- list 16 -->
		<rule context="//onix:WorkIdentifier[onix:WorkIDType = '02']/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-10"/></rule>
		<rule context="//onix:WorkIdentifier[onix:WorkIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_doi"/></rule>
		<rule context="//onix:WorkIdentifier[onix:WorkIDType = '11']/onix:IDValue"><extends rule="abstract_check_identifier_format_istc"/></rule>
		<rule context="//onix:WorkIdentifier[onix:WorkIDType = '15']/onix:IDValue"><extends rule="abstract_check_identifier_format_isbn-13"/></rule>
		<!-- list 92 -->
		<rule context="//AgentIdentifier[onix:AgentIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//AgentIdentifier[onix:AgentIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//AgentIdentifier[onix:AgentIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//SupplierIdentifier[onix:SupplierIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//SupplierIdentifier[onix:SupplierIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//SupplierIdentifier[onix:SupplierIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<rule context="//LocationIdentifier[onix:LocationIDType = '06']/onix:IDValue"><extends rule="abstract_check_identifier_format_gln"/></rule>
		<rule context="//LocationIdentifier[onix:LocationIDType = '07']/onix:IDValue"><extends rule="abstract_check_identifier_format_san"/></rule>
		<rule context="//LocationIdentifier[onix:LocationIDType = '16']/onix:IDValue"><extends rule="abstract_check_identifier_format_isni"/></rule>
		<!-- fallback -->
		<rule context="//onix:IDValue"><extends rule="abstract_lib_check_leading_and_trailing_whitespace"/></rule>
		<rule abstract="true" id="abstract_check_identifier_format_list139">
			<assert role="error" test=". = $list139" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid ONIX Sales Outlet Identifier – see List 139.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_issn-8">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{7}[0-9Xx]$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> must consist of eight digits, of which the last can be X.
			</assert>
			<extends rule="abstract_check_identifier_format_isbn"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_gln">
			<extends rule="abstract_check_identifier_format_gtin-13"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_san">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{6}[0-9Xx]$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> must consist of seven digits, of which the last can be X.
			</assert>
			<extends rule="abstract_check_identifier_format_isbn"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_isbn-10">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{9}[0-9Xx]$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> must consist of ten digits, of which the last can be X.
			</assert>
			<extends rule="abstract_check_identifier_format_isbn"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_gtin-13">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{13}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a GTIN-13 – must consist of thirteen digits.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_gtin-12">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{12}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a GTIN-12 – must consist of twelve digits.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_ismn-10">
			<assert role="error" test="matches(normalize-space(), 'M[0-9]{9}')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ISMN-10 – must consist of M plus nine digits.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_doi">
			<assert role="error" test="matches(normalize-space(), '^10(\.[^(\s|\.)]+)+/\S+$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid DOI.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_gtin-14">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{14}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an GTIN-14 – must consist of fourteen digits.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_isbn-13">
			<assert role="error" test="matches(normalize-space(), '^(978[0-9]|979[1-9])[0-9]{9}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ISBN.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_ismn-13">
			<assert role="error" test="matches(normalize-space(), '^9790[0-9]{9}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ISMN.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_issn-13">
			<assert role="error" test="matches(normalize-space(), '^977[0-9]{10}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ISSN.
			</assert>
			<extends rule="abstract_check_identifier_format_gtin"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_isbn-a">
			<assert role="error" test="matches(normalize-space(), '^(10\.978\.[0-9]{2,8}|10\.979\.[1-9][0-9]{1,7})/[0-9]{2,8}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ISBN-A.
			</assert>
			<!-- does not check the check digit or the exact placement of the / in the DOI -->
			<extends rule="abstract_check_identifier_format_doi"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_orcid">
			<assert role="error" test="matches(normalize-space(), '^[0]{7}(1[5-9]|2[0-9]|3[0-4])[0-9]{6}[0-9Xx]$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ORCID.
			</assert>
			<extends rule="abstract_check_identifier_format_isni"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_isni">
			<assert role="error" test="matches(normalize-space(), '^[0-9]{15}[0-9Xx]$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not an ISNI.
			</assert>
			<let name="id" value="normalize-space()"/>
			<let name="d1" value="number(substring($id, 1, 1))"/>
			<let name="d2" value="number(substring($id, 2, 1))"/>
			<let name="d3" value="number(substring($id, 3, 1))"/>
			<let name="d4" value="number(substring($id, 4, 1))"/>
			<let name="d5" value="number(substring($id, 5, 1))"/>
			<let name="d6" value="number(substring($id, 6, 1))"/>
			<let name="d7" value="number(substring($id, 7, 1))"/>
			<let name="d8" value="number(substring($id, 8, 1))"/>
			<let name="d9" value="number(substring($id, 9, 1))"/>
			<let name="d10" value="number(substring($id, 10, 1))"/>
			<let name="d11" value="number(substring($id, 11, 1))"/>
			<let name="d12" value="number(substring($id, 12, 1))"/>
			<let name="d13" value="number(substring($id, 13, 1))"/>
			<let name="d14" value="number(substring($id, 14, 1))"/>
			<let name="d15" value="number(substring($id, 15, 1))"/>
			<let name="d16" value="if (matches(substring($id, 16, 1), 'X|x')) then 10 else number(substring($id, 16, 1))"/>
			<assert role="error" test="not(matches($id, '^[0-9]{15}[0-9Xx]$')) or $d16 = (12 - (32768 * $d1 + 16384 * $d2 + 8192 * $d3 + 4096 * $d4 + 2048 * $d5 + 1024 * $d6 + 512 * $d7 + 256 * $d8 + 128 * $d9 + 64 * $d10 + 32 * $d11 + 16 * $d12 + 8 * $d13 + 4 * $d14 + 2 * $d15) mod 11) mod 11" diagnostics="diagnostic_recordreference">
				<value-of select="$id"/> is not a valid ISNI or ORCID – checksum error.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_istc">
			<assert role="error" test="matches(normalize-space(), '^[0-9A-Fa-f]{3}2[0-9]{3}[0-9A-Fa-f]{9}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> must consist of sixteen hexadecimal digits.
			</assert>
			<let name="hex" value="string-to-codepoints(translate(normalize-space(),'0123456789ABCDEFabcdef','0123456789:;&lt;=&gt;?:;&lt;=&gt;?'))"/>
			<let name="base" value="string-to-codepoints('0')"/>
			<let name="h1" value="subsequence($hex,1,1) - $base"/>
			<let name="h2" value="subsequence($hex,2,1) - $base"/>
			<let name="h3" value="subsequence($hex,3,1) - $base"/>
			<let name="h4" value="subsequence($hex,4,1) - $base"/>
			<let name="h5" value="subsequence($hex,5,1) - $base"/>
			<let name="h6" value="subsequence($hex,6,1) - $base"/>
			<let name="h7" value="subsequence($hex,7,1) - $base"/>
			<let name="h8" value="subsequence($hex,8,1) - $base"/>
			<let name="h9" value="subsequence($hex,9,1) - $base"/>
			<let name="h10" value="subsequence($hex,10,1) - $base"/>
			<let name="h11" value="subsequence($hex,11,1) - $base"/>
			<let name="h12" value="subsequence($hex,12,1) - $base"/>
			<let name="h13" value="subsequence($hex,13,1) - $base"/>
			<let name="h14" value="subsequence($hex,14,1) - $base"/>
			<let name="h15" value="subsequence($hex,15,1) - $base"/>
			<let name="h16" value="subsequence($hex,16,1) - $base"/>
			<assert role="error" test="not(matches(normalize-space(), '^[0-9A-Fa-f]{3}2[0-9]{3}[0-9A-Fa-f]{9}$')) or $h16 = (11 * ($h1 + $h5 + $h9 + $h13) + 9 * ($h2 + $h6 + $h10 + $h14) + 3 * ($h3 + $h7 + $h11 + $h15) + $h4 + $h8 + $h12) mod 16" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid ISTC – checksum error.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_gtin">
			<!-- works for ISMN-10, UPC (= GTIN-12), ISBN-13, ISSN-13, ISMN-13, GLN (= GTIN-13), GTIN-14 -->
			<let name="id" value="if (string-length(normalize-space()) = 10) then replace(normalize-space(), 'M', '09790') else if (string-length(normalize-space()) = 12) then concat('00', normalize-space()) else if (string-length(normalize-space()) = 13) then concat('0', normalize-space()) else normalize-space()"/>
			<let name="d1" value="number(substring($id, 1, 1))"/>
			<let name="d2" value="number(substring($id, 2, 1))"/>
			<let name="d3" value="number(substring($id, 3, 1))"/>
			<let name="d4" value="number(substring($id, 4, 1))"/>
			<let name="d5" value="number(substring($id, 5, 1))"/>
			<let name="d6" value="number(substring($id, 6, 1))"/>
			<let name="d7" value="number(substring($id, 7, 1))"/>
			<let name="d8" value="number(substring($id, 8, 1))"/>
			<let name="d9" value="number(substring($id, 9, 1))"/>
			<let name="d10" value="number(substring($id, 10, 1))"/>
			<let name="d11" value="number(substring($id, 11, 1))"/>
			<let name="d12" value="number(substring($id, 12, 1))"/>
			<let name="d13" value="number(substring($id, 13, 1))"/>
			<let name="d14" value="number(substring($id, 14, 1))"/>
			<assert role="error" test="not(matches($id, '^[0-9]{14}$')) or (3 * ($d1 + $d3 + $d5 + $d7 + $d9 + $d11 + $d13) + $d2 + $d4 + $d6 + $d8 + $d10 + $d12 + $d14) mod 10 = 0" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid GTIN, GLN, ISBN, ISSN or ISMN – checksum error.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_identifier_format_isbn">
			<!-- works for ISBN-10 and ISSN-8 and SAN-7 -->
			<let name="id" value="if (string-length(normalize-space()) = 7) then concat('000', normalize-space()) else if (string-length(normalize-space()) = 8) then concat('00', normalize-space()) else normalize-space()"/>
			<let name="d1" value="number(substring($id, 1, 1))"/>
			<let name="d2" value="number(substring($id, 2, 1))"/>
			<let name="d3" value="number(substring($id, 3, 1))"/>
			<let name="d4" value="number(substring($id, 4, 1))"/>
			<let name="d5" value="number(substring($id, 5, 1))"/>
			<let name="d6" value="number(substring($id, 6, 1))"/>
			<let name="d7" value="number(substring($id, 7, 1))"/>
			<let name="d8" value="number(substring($id, 8, 1))"/>
			<let name="d9" value="number(substring($id, 9, 1))"/>
			<let name="d10" value="if (matches(substring($id, 10, 1), 'X|x')) then 10 else number(substring($id, 10, 1))"/>
			<assert role="error" test="not(matches($id, '^[0-9]{9}[0-9Xx]$')) or $d10 = ($d1 + 2 * $d2 + 3 * $d3 + 4 * $d4 + 5 * $d5 + 6 * $d6 + 7 * $d7 + 8 * $d8 + 9 * $d9) mod 11" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid ISBN-10, SAN or ISSN – checksum error.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_deprecated_elements">
		<rule context="//onix:DateFormat"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:AudienceCode"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:Complexity"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:PublisherRepresentative/onix:TelephoneNumber"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:PublisherRepresentative/onix:FaxNumber"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:PublisherRepresentative/onix:EmailAddress"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:MarketPublishingDetail/onix:PromotionContact"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:CurrencyZone"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule context="//onix:Reissue"><extends rule="abstract_check_deprecated_element"/></rule>
		<rule abstract="true" id="abstract_check_deprecated_element">
			<assert role="warn" test="false()" diagnostics="diagnostic_recordreference">
				Use of <name/> is deprecated.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_unused_deprecated_and_invalid_code_values">
		<!-- list 1 -->
		<rule id="_1003" context="//onix:NotificationType[matches(., '12|13|14')]"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<!-- list 5 -->
		<rule id="_1053" context="//onix:ProductIDType[matches(., '02|05')]"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<!-- list 16 -->
		<rule context="//onix:WorkIDType[. = '02']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<!-- list 21 -->
		<rule context="//onix:EditionType[. = 'ALT']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 27 -->
		<rule context="//onix:SubjectSchemeIdentifier[. = '27']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<!-- list 29 -->
		<rule context="//onix:AudienceCodeType[. = '(19|20|25)']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 30 -->
		<rule context="//onix:AudienceRangeQualifier[. = '(23|24|25)']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 32 -->
		<rule context="//onix:ComplexitySchemeIdentifier[. = '(01|02)']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 34 -->
		<rule context="//@textformat[matches(., '[^(02|03|05|06|07)]')]"><extends rule="abstract_check_invalid_code_value_in_attribute"/></rule>
		<!-- list 44 -->
		<rule context="//onix:SenderIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:AddresseeIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule id="_1009" context="//onix:RecordSourceIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:NameIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:ConferenceSponsorIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:ImprintIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:PublisherIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:ProductContactIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:CopyrightOwnerIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:SenderIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:AddresseeIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:RecordSourceIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:NameIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:ConferenceSponsorIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:ImprintIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:PublisherIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:ProductContactIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<rule context="//onix:CopyrightOwnerIDType[. = '(17|20)']"><extends rule="abstract_check_deprecated_legacy_code_value_in_element"/></rule>
		<!-- list 45 -->
		<rule context="//onix:PublishingRole[. = '08']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 46 -->
		<rule context="//onix:SalesRightsType[. = '00']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:SalesRightsType[. = '(07|08)']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 49 -->
		<rule context="//onix:RegionCode[matches(., 'GB-CHA|GB-IOM')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:RegionsIncluded[matches(., 'GB-CHA|GB-IOM')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:RegionsExcluded[matches(., 'GB-CHA|GB-IOM')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:RegionCode[matches(., 'ECZ|ROW|WORLD')]"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:RegionsIncluded[. = 'ROW']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:RegionsExcluded[matches(., 'ROW|WORLD')]"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:SalesRights/onix:Territory/onix:RegionsIncluded[. = 'ECZ']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:SalesRights/onix:Territory/onix:RegionsExcluded[. = 'ECZ']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:Market/onix:Territory/onix:RegionsIncluded[. = 'ECZ']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<rule context="//onix:Market/onix:Territory/onix:RegionsExcluded[. = 'ECZ']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<!-- list 51 -->
		<rule context="//onix:ProductRelationCode[matches(., '14|15')]"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<!-- list 53 -->
		<rule context="//onix:ReturnsCodeType[. = '03']"><extends rule="abstract_check_invalid_code_value_in_element"/></rule>
		<!-- list 64 -->
		<rule context="//onix:PublishingStatus[. = '12']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 74 -->
		<rule context="//@language[matches(., 'mol|scc|scr')]"><extends rule="abstract_check_deprecated_code_value_in_attribute"/></rule>
		<rule context="//onix:DefaultLanguageOfText[matches(., 'mol|scc|scr')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:FromLanguage[matches(., 'mol|scc|scr')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:ToLanguage[matches(., 'mol|scc|scr')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:LanguageCode[matches(., 'mol|scc|scr')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 79 -->
		<rule id="_1054" context="//onix:ProductFormFeatureType[. = '11']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 91 -->
		<rule id="_1055" context="//onix:CountryOfManufacture[matches(., 'AN|CS|YU')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:CountryCode[matches(., 'AN|CS|YU')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:PrizeCountry[matches(., 'AN|CS|YU')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:CountryOfPublication[matches(., 'AN|CS|YU')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:CountriesIncluded[matches(., 'AN|CS|YU')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:CountriesExcluded[matches(., 'AN|CS|YU')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 92 -->
		<rule context="//onix:AgentIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:SupplierIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:LocationIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 93 -->
		<rule context="//onix:SupplierRole[. = '05']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 96 -->
		<rule context="//onix:DefaultCurrencyCode[matches(., 'AFA|BGL|CSD|GHC|ROL|RUR|SRG|TMM|TRL|VEB|YUM|ZWD')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule context="//onix:CurrencyCode[matches(., 'AFA|BGL|CSD|GHC|ROL|RUR|SRG|TMM|TRL|VEB|YUM|ZWD')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 102 -->
		<rule context="//onix:SalesOutletIDType[. = '02']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 158 -->
		<rule context="//onix:ResourceContentType[. = '99']"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 175 -->
		<rule id="_1056" context="//onix:ProductFormDetail[matches(., 'A201|A207|B703')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<!-- list 176 -->
		<rule id="_1057" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '06']/onix:ProductFormFeatureValue[matches(., '05|06')]"><extends rule="abstract_check_deprecated_code_value_in_element"/></rule>
		<rule abstract="true" id="abstract_check_invalid_code_value_in_element">
			<assert role="error" test="false()" diagnostics="diagnostic_recordreference">
				Code <value-of select="."/> in <name/> is not valid.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_invalid_code_value_in_attribute">
			<assert role="error" test="false()" diagnostics="diagnostic_recordreference">
				Code <value-of select="."/> in <value-of select="local-name(parent::element())"/> @<name/> is not valid.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_deprecated_code_value_in_element">
			<assert role="warn" test="false()" diagnostics="diagnostic_recordreference">
				Code <value-of select="."/> in <name/> is deprecated.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_deprecated_legacy_code_value_in_element">
			<assert role="warn" test="false()" diagnostics="diagnostic_recordreference">
				Code <value-of select="."/> in <name/> is deprecated, except for compatibility with legacy systems.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_deprecated_code_value_in_attribute">
			<assert role="warn" test="false()" diagnostics="diagnostic_recordreference">
				Code <value-of select="."/> in <value-of select="local-name(parent::element())"/> @<name/> is deprecated..
			</assert>
		</rule>
	</pattern>

	<pattern id="check_namespace_with_proprietary_identifiers_and_codeschemes">
		<!-- list 44 -->
		<rule context="//onix:SenderIdentifier[matches(onix:SenderIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:SenderIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:AddresseeIdentifier[matches(onix:AddresseeIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:AddresseeIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule id="_1010" context="//onix:RecordSourceIdentifier[matches(onix:RecordSourceIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule id="_1011" context="//onix:RecordSourceIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 5 -->
		<rule id="_1019" context="//onix:ProductIdentifier[onix:ProductIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule id="_1020" context="//onix:ProductIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 13 -->
		<rule context="//onix:CollectionIdentifier[onix:CollectionIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:CollectionIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 44 again -->
		<rule context="//onix:NameIdentifier[matches(onix:NameIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:NameIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier[onix:ConferenceSponsorIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:ConferenceSponsorIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 43 -->
		<rule context="//onix:TextItemIdentifier[onix:TextItemIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:TextItemIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 44 again -->
		<rule context="//onix:ImprintIdentifier[matches(onix:ImprintIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:ImprintIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:PublisherIdentifier[matches(onix:PublisherIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:PublisherIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:ProductContactIdentifier[matches(onix:ProductContactIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:ProductContactIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier[matches(onix:CopyrightOwnerIDType, '01|02')]"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:CopyrightOwnerIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 139 -->
		<rule context="//onix:SalesOutletIdentifier[onix:SalesOutletIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:SalesOutletIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 16 -->
		<rule context="//onix:WorkIdentifier[onix:WorkIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:WorkIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 92 -->
		<rule context="//onix:AgentIdentifier[onix:AgentIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:AgentIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:SupplierIdentifier[onix:SupplierIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:SupplierIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<rule context="//onix:LocationIdentifier[onix:LocationIDType = '01']"><extends rule="abstract_check_namespace_with_proprietary_identifier"/></rule>
		<rule context="//onix:LocationIdentifier"><extends rule="abstract_check_namespace_with_non-proprietary_identifier"/></rule>
		<!-- list 197 -->
		<rule context="//onix:CollectionSequence[onix:CollectionSequenceType = '01']"><extends rule="abstract_check_namespace_with_proprietary_collection_sequence_code"/></rule>
		<rule context="//onix:CollectionSequence"><extends rule="abstract_check_namespace_with_non-proprietary_collection_sequence_code"/></rule>
		<!-- list 27 -->
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '23']"><extends rule="abstract_check_namespace_with_proprietary_category"/></rule>
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '24']"><extends rule="abstract_check_namespace_with_proprietary_subject"/></rule>
		<rule context="//onix:Subject"><extends rule="abstract_check_namespace_with_non-proprietary_subject"/></rule>
		<!-- list 29 -->
		<rule context="//onix:AudienceCode[onix:AudienceCodeType = '02']"><extends rule="abstract_check_namespace_with_proprietary_audience_code"/></rule>
		<rule context="//onix:AudienceCode"><extends rule="abstract_check_namespace_with_non-proprietary_audience_code"/></rule>
		<!-- list 53 -->
		<rule context="//onix:ReturnsConditions[onix:ReturnsCodeType = '00']"><extends rule="abstract_check_namespace_with_proprietary_returns_code"/></rule>
		<rule context="//onix:ReturnsConditions"><extends rule="abstract_check_namespace_with_non-proprietary_returns_code"/></rule>
		<!-- list 70 -->
		<rule context="//onix:StockQuantityCoded[onix:StockQuantityCodeType = '01']"><extends rule="abstract_check_namespace_with_proprietary_stock_quantity_code"/></rule>
		<rule context="//onix:StockQuantityCoded"><extends rule="abstract_check_namespace_with_non-proprietary_stock_quantity_code"/></rule>
		<!-- list 100 -->
		<rule context="//onix:DiscountCoded[matches(onix:DiscountCodeType, '02|05')]"><extends rule="abstract_check_namespace_with_proprietary_discount_code"/></rule>
		<rule context="//onix:DiscountCoded"><extends rule="abstract_check_namespace_with_non-proprietary_discount_code"/></rule>
		<!-- list 179 -->
		<rule context="//onix:PriceCoded[onix:PriceCodeType = '01']"><extends rule="abstract_check_namespace_with_proprietary_price_code"/></rule>
		<rule context="//onix:PriceCoded"><extends rule="abstract_check_namespace_with_non-proprietary_price_code"/></rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_identifier">
			<assert role="error" test="onix:IDTypeName" diagnostics="diagnostic_recordreference">
				A proprietary identifier in <name/> requires a likely-to-be-unique name in IDTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_identifier">
			<assert role="error" test="not(onix:IDTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary identifier in <name/> should not have a name in IDTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_discount_code">
			<assert role="error" test="onix:DiscountCodeTypeName" diagnostics="diagnostic_recordreference">
				A proprietary discount code in <name/> requires a likely-to-be-unique name in DiscountCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_discount_code">
			<assert role="error" test="not(onix:DiscountCodeTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary discount code in <name/> should not have a name in DiscountCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_collection_sequence_code">
			<assert role="error" test="onix:CollectionSequenceTypeName" diagnostics="diagnostic_recordreference">
				A proprietary collection sequence in <name/> requires a likely-to-be-unique name in CollectionSequenceTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_collection_sequence_code">
			<assert role="error" test="not(onix:CollectionSequenceTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary collection sequence in <name/> should not have a name in CollectionSequenceTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_audience_code">
			<assert role="error" test="onix:AudienceCodeTypeName" diagnostics="diagnostic_recordreference">
				A proprietary audience code in <name/> requires a likely-to-be-unique name in AudienceCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_audience_code">
			<assert role="error" test="not(onix:AudienceCodeTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary audience code in <name/> should not have a name in AudienceCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_returns_code">
			<assert role="error" test="onix:ReturnsCodeTypeName" diagnostics="diagnostic_recordreference">
				A proprietary returns code in <name/> requires a likely-to-be-unique name in ReturnsCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_returns_code">
			<assert role="error" test="not(onix:ReturnsCodeTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary returns code in <name/> should not have a name in ReturnsCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_stock_quantity_code">
			<assert role="error" test="onix:StockQuantityCodeTypeName" diagnostics="diagnostic_recordreference">
				A proprietary stock quantity code in <name/> requires a likely-to-be-unique name in StockQuantityCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_stock_quantity_code">
			<assert role="error" test="not(onix:StockQuantityCodeTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary stock quantity code in <name/> should not have a name in StockQuantityCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_price_code">
			<assert role="error" test="onix:PriceCodeTypeName" diagnostics="diagnostic_recordreference">
				A proprietary price code in <name/> requires a likely-to-be-unique name in PriceCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_price_code">
			<assert role="error" test="not(onix:PriceCodeTypeName)" diagnostics="diagnostic_recordreference">
				A non-proprietary price code in <name/> should not have a name in PriceCodeTypeName.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_subject">
			<assert role="error" test="onix:SubjectSchemeName" diagnostics="diagnostic_recordreference">
				A proprietary subject scheme must have a name.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_proprietary_category">
			<assert role="error" test="onix:SubjectSchemeName" diagnostics="diagnostic_recordreference">
				A proprietary category scheme must have a name.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_namespace_with_non-proprietary_subject">
			<assert role="error" test="not(onix:SubjectSchemeName)" diagnostics="diagnostic_recordreference">
				A standard subject scheme must not have a name.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_productformdetail_dependencies">
		<rule id="_1058" context="//onix:ProductFormDetail[matches(., 'A101|A102')]"><extends rule="abstract_check_is_cd_audio_product"/></rule>
		<rule id="_1059" context="//onix:ProductFormDetail[matches(., 'A1\d\d')]"><extends rule="abstract_check_is_audio_file_product"/></rule>
		<rule id="_1060" context="//onix:ProductFormDetail[matches(., 'A2\d\d')]"><extends rule="abstract_check_is_audio_file_product"/></rule>
		<rule id="_1061" context="//onix:ProductFormDetail[matches(., 'A3\d\d')]"><extends rule="abstract_check_is_audio_product"/></rule>
		<rule id="_1062" context="//onix:ProductFormDetail[matches(., 'B101|B102|B103|B104|B105|B106|B107')]"><extends rule="abstract_check_is_paperback"/></rule>
		<rule id="_1063" context="//onix:ProductFormDetail[matches(., 'B108|B109|B110|B111|B112')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1064" context="//onix:ProductFormDetail[matches(., 'B113|B114|B116|B117|B118')]"><extends rule="abstract_check_is_paperback"/></rule>
		<rule id="_1065" context="//onix:ProductFormDetail[matches(., 'B115')]"><extends rule="abstract_check_is_hardback"/></rule>
		<rule id="_1066" context="//onix:ProductFormDetail[matches(., 'B119|B12[0-9]|B130')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1067" context="//onix:ProductFormDetail[matches(., 'B2\d\d')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1068" context="//onix:ProductFormDetail[matches(., 'B301|B302|B303')]"><extends rule="abstract_check_is_loose_leaf"/></rule>
		<rule id="_1069" context="//onix:ProductFormDetail[matches(., 'B304|B305|B306|B307|B308|B309|B310')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1070" context="//onix:ProductFormDetail[matches(., 'B311|B312|B313')]"><extends rule="abstract_check_is_spiral_bound"/></rule>
		<rule id="_1071" context="//onix:ProductFormDetail[matches(., 'B401|B402')]"><extends rule="abstract_check_is_hardback"/></rule>
		<rule id="_1072" context="//onix:ProductFormDetail[matches(., 'B403|B404|B405|B406')]"><extends rule="abstract_check_is_fine_binding"/></rule>
		<rule id="_1073" context="//onix:ProductFormDetail[matches(., 'B409|B410|B411|B412|B413|B414|B415')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1075" context="//onix:ProductFormDetail[matches(., 'B504')]"><extends rule="abstract_check_is_paperback"/></rule>
		<rule id="_1074" context="//onix:ProductFormDetail[matches(., 'B5\d\d')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1076" context="//onix:ProductFormDetail[matches(., 'B601|B602')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1077" context="//onix:ProductFormDetail[matches(., 'B70[1-6]')]"><extends rule="abstract_check_is_physical_book"/><extends rule="abstract_check_is_braille_edition"/></rule>
		<rule id="_1078" context="//onix:ProductFormDetail[matches(., 'B707')]"><extends rule="abstract_check_is_physical_book"/></rule>
		<rule id="_1079" context="//onix:ProductFormDetail[matches(., 'D10[1-5]')]"><extends rule="abstract_check_is_video_file_product"/></rule>
		<rule id="_1080" context="//onix:ProductFormDetail[matches(., 'D20[1-7]')]"><extends rule="abstract_check_is_digital_on_physical_product"/></rule>
		<rule id="_1081" context="//onix:ProductFormDetail[matches(., 'D3(0[1-9]|1[0-6])')]"><extends rule="abstract_check_is_digital_on_physical_product"/></rule>
		<rule id="_1082" context="//onix:ProductFormDetail[matches(., 'E1\d\d')]"><extends rule="abstract_check_is_ebook_or_app"/></rule>
		<rule id="_1083" context="//onix:ProductFormDetail[matches(., 'E2\d\d')]"><extends rule="abstract_check_is_ebook_or_app"/></rule>
		<rule id="_1084" context="//onix:ProductFormDetail[matches(., 'P1(0[1-9]|1[0-3])')]"><extends rule="abstract_check_is_calendar"/></rule>
		<rule id="_1085" context="//onix:ProductFormDetail[matches(., 'P114')]"><extends rule="abstract_check_is_calendar_or_organizer"/></rule>
		<rule id="_1086" context="//onix:ProductFormDetail[matches(., 'P20[1-4]')]"><extends rule="abstract_check_is_stationery"/></rule>
		<rule id="_1087" context="//onix:ProductFormDetail[matches(., 'V20[1-3]')]"><extends rule="abstract_check_is_analogue_video"/></rule>
		<rule abstract="true" id="abstract_check_is_cd_audio_product">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'AC'" diagnostics="diagnostic_recordreference">
				Only CD-Audio products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_audio_file_product">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, '(A[^BCF])|D.|E.')" diagnostics="diagnostic_recordreference">
				Only digital audio products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_audio_product">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'A.|D.|E.')" diagnostics="diagnostic_recordreference">
				Only audio products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_video_file_product">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'D.|E.|VA|VZ')" diagnostics="diagnostic_recordreference">
				Only digital video products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_hardback">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'BB'" diagnostics="diagnostic_recordreference">
				Only hardbacks can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_paperback">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'BC'" diagnostics="diagnostic_recordreference">
				Only paperbacks can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_loose_leaf">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'BD'" diagnostics="diagnostic_recordreference">
				Only loose leaf products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_spiral_bound">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'BE'" diagnostics="diagnostic_recordreference">
				Only spiral-bound products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_fine_binding">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'BG'" diagnostics="diagnostic_recordreference">
				Only spiral-bound products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_physical_book">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'B.')" diagnostics="diagnostic_recordreference">
				Only physical book products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_digital_on_physical_product">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'D.')" diagnostics="diagnostic_recordreference">
				Only digital-on-physical products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_ebook_or_app">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'D.|E.')" diagnostics="diagnostic_recordreference">
				Only e-book and ‘app’ products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_calendar">
			<assert role="error" test="preceding-sibling::onix:ProductForm = 'PC'" diagnostics="diagnostic_recordreference">
				Only calendar products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_calendar_or_organizer">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'PC|PS')" diagnostics="diagnostic_recordreference">
				Only calendar or organizer products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_stationery">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'PA|PB|PF|PL|PR|PS|PZ')" diagnostics="diagnostic_recordreference">
				Only stationery products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_analogue_video">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'VA|VI|VJ|VK|VZ')" diagnostics="diagnostic_recordreference">
				Only analogue video products can have <name/> <value-of select="."/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_braille_edition">
			<assert role="warn" test="following-sibling::onix:EditionType = 'BRL'" diagnostics="diagnostic_recordreference">
				If the product is Braille, it should be listed as a Braille edition.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_productformfeature_dependencies">
		<rule id="_1089" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '01|02|03|04|08')]"><extends rule="abstract_check_is_physical_book_feature"/></rule>
		<rule id="_1090" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '05']"><extends rule="abstract_check_is_regionalised_dvd_product_feature"/></rule>
		<rule id="_1091" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '06|07')]"><extends rule="abstract_check_is_electronic_product_feature"/></rule>
		<rule id="_1092" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '09|10')]"><extends rule="abstract_check_is_ebook_or_app_feature"/></rule>
		<rule id="_1093" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '3.|40')]"><extends rule="abstract_check_is_paper_feature"/></rule>
		<rule abstract="true" id="abstract_check_is_regionalised_dvd_product_feature">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'VI|VO')" diagnostics="diagnostic_recordreference">
				Only regionalised DVD/Blu-ray products can have <name path="onix:ProductFormFeatureType"/> <value-of select="onix:ProductFormFeatureType"/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_physical_book_feature">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'B.')" diagnostics="diagnostic_recordreference">
				Only physical book products can have <name path="onix:ProductFormFeatureType"/> <value-of select="onix:ProductFormFeatureType"/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_electronic_product_feature">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'A[^BCF]|D.|E.|LC')" diagnostics="diagnostic_recordreference">
				Only digital products can carry technical requirements.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_ebook_or_app_feature">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'D.|E.')" diagnostics="diagnostic_recordreference">
				Only e-book and ‘app’ products can have format versions or accessibility features.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_paper_feature">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'B.|C.|P.')" diagnostics="diagnostic_recordreference">
				Only paper products can conform to FSC or PEFC standards.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_productformfeature_microsyntaxes_and_interdependencies">
		<rule id="_1105" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '01|02|04|06|09|10|11|12|13|31|32|33|34|35|36|37')]"><extends rule="abstract_check_productformfeaturevalue_exists"/></rule>
		<rule id="_1106" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '03|07|08')]"><extends rule="abstract_check_only_productformfeaturedescription_exists"/></rule>
		<rule id="_1107" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '05')]"><extends rule="abstract_check_only_productformfeaturevalue_exists"/></rule>
		<rule id="_1108" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '30')]"><extends rule="abstract_check_only_productformfeaturetype_exists"/></rule>
		<rule id="_1109" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '40')]"><extends rule="abstract_check_no_productformfeaturevalue_exists"/></rule>
		<rule id="_1088" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '01|02')]/onix:ProductFormFeatureValue"><extends rule="abstract_check_list98"/></rule>
		<rule id="_1094" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '04']/onix:ProductFormFeatureValue"><extends rule="abstract_check_list99"/></rule>
		<rule id="_1095" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '05']/onix:ProductFormFeatureValue"><extends rule="abstract_check_list76"/></rule>
		<rule id="_1096" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '06']/onix:ProductFormFeatureValue"><extends rule="abstract_check_list176"/></rule>
		<rule id="_1097" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '09']/onix:ProductFormFeatureValue"><extends rule="abstract_check_list196"/></rule>
		<rule id="_1098" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '10']/onix:ProductFormFeatureValue"><extends rule="abstract_check_productformfeature_epubversion"/></rule>
		<rule id="_1099" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '11|12')]/onix:ProductFormFeatureValue"><extends rule="abstract_check_list143"/></rule>
		<rule id="_1100" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '13']/onix:ProductFormFeatureValue"><extends rule="abstract_check_list184"/></rule>
		<rule id="_1101" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '31|32|33')]/onix:ProductFormFeatureValue"><extends rule="abstract_check_productformfeature_fsc"/></rule>
		<rule id="_1104" context="//onix:ProductFormFeature[matches(onix:ProductFormFeatureType, '34|35')]/onix:ProductFormFeatureValue"><extends rule="abstract_check_productformfeature_pefc"/></rule>
		<rule id="_1102" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '36']/onix:ProductFormFeatureValue"><extends rule="abstract_check_productformfeature_pcw"/></rule>
		<rule id="_1103" context="//onix:ProductFormFeature[onix:ProductFormFeatureType = '37']/onix:ProductFormFeatureValue"><extends rule="abstract_check_productformfeature_uncertifiedpcw"/></rule>
		<rule abstract="true" id="abstract_check_only_productformfeaturevalue_exists">
			<assert role="error" test="onix:ProductFormFeatureValue and not(onix:ProductFormFeatureDescription)" diagnostics="diagnostic_recordreference">
				ProductFormFeatureValue must be present and ProductFormFeatureDescription omitted.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_productformfeaturevalue_exists">
			<assert role="error" test="onix:ProductFormFeatureValue" diagnostics="diagnostic_recordreference">
				ProductFormFeatureValue must contain a code value.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_only_productformfeaturedescription_exists">
			<assert role="error" test="onix:ProductFormFeatureDescription and not(onix:ProductFormFeatureValue)" diagnostics="diagnostic_recordreference">
				ProductFormFeatureDescription must be present and ProductFormFeatureValue omitted.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_no_productformfeaturevalue_exists">
			<assert role="error" test="not(onix:ProductFormFeatureValue)" diagnostics="diagnostic_recordreference">
				ProductFormFeatureValue must be omitted.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_only_productformfeaturetype_exists">
			<assert role="error" test="not(onix:ProductFormFeatureValue) and not(onix:ProductFormFeatureDescription)" diagnostics="diagnostic_recordreference">
				Both ProductFormFeatureValue nor ProductFormFeatureDescription must be omitted.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list76">
			<assert role="error" test=". = $list76" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid DVD/Blu-Ray region – see List 76.
			</assert>
		</rule>
		
		<rule abstract="true" id="abstract_check_list98">
			<assert role="error" test=". = $list98" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid color – see List 98.
			</assert>
		</rule>
		
		<rule abstract="true" id="abstract_check_list99">
			<assert role="error" test=". = $list99" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid cover material – see List 99.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list143">
			<assert role="error" test=". = $list143" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid CPSIA hazard warning – see List 143.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list176">
			<assert role="error" test=". = $list176" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid operating system – see List 176.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list184">
			<assert role="error" test=". = $list184" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid EU Toy Safety hazard warning – see List 184.
			</assert>
			<assert role="error" test="not(matches(., '^(02|04|05)$')) or following-sibling::onix:ProductFormFeatureDescription" diagnostics="diagnostic_recordreference">
				For code <value-of select="normalize-space()"/> in <name/>, ProductFormFeatureDescription must contain warning text.
			</assert>
			<assert role="error" test="not(matches(., '^(06|07)$')) or (every $description in following-sibling::onix:ProductFormFeatureDescription satisfies matches(normalize-space($description), '^(http|ftp)s?://\S+$'))" diagnostics="diagnostic_recordreference">
				For code <value-of select="normalize-space()"/> in <name/>, ProductFormFeatureDescription must contain a URL.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list196">
			<assert role="error" test=". = $list196" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid accessibility feature – see List 196.
			</assert>
			<assert role="error" test="not(matches(., '^(94|95|96|97|98|99)$')) or (every $description in following-sibling::onix:ProductFormFeatureDescription satisfies matches(normalize-space($description), '^(http|ftp)s?://\S+$'))" diagnostics="diagnostic_recordreference">
				ProductFormFeatureDescription must contain a URL.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_productformfeature_epubversion">
			<assert role="error" test="matches(normalize-space(), '^\S+$')" diagnostics="diagnostic_recordreference">
				ProductFormFeatureValue must contain the e-publication format version number.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_productformfeature_fsc">
			<assert role="error" test="matches(normalize-space(), '^([A-Z]{2,5}\-COC\-[0-9]{6}|C[0-9]{6})$')" diagnostics="diagnostic_recordreference">
				ProductFormFeatureValue must contain a valid FSC certification number.
			</assert>
			<assert role="error" test="not(parent::element()/parent::element()/onix:ProductFormFeature[matches(normalize-space(onix:ProductFormFeatureType), '30|37')])" diagnostics="diagnostic_recordreference">
				FSC certification cannot apply to an uncertified product (value of 30/37 in another ProductFormFeatureType).
			</assert>
			<assert role="error" test="not(parent::element()/preceding-sibling::onix:ProductFormFeature[matches(normalize-space(onix:ProductFormFeatureType), '31|32|33')])" diagnostics="diagnostic_recordreference">
				Cannot have more than one FSC certification (value of 31/32/33 in preceding ProductFormFeatureType).
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_productformfeature_pefc">
			<!-- does not validate microsyntax of certification number -->
			<assert role="error" test="not(parent::element()/parent::element()/onix:ProductFormFeature[matches(normalize-space(onix:ProductFormFeatureType), '30|37')])" diagnostics="diagnostic_recordreference">
				PEFC certification cannot apply to an uncertified product (value of 30/37 in another ProductFormFeatureType).
			</assert>
			<assert role="error" test="not(parent::element()/preceding-sibling::onix:ProductFormFeature[matches(normalize-space(onix:ProductFormFeatureType), '34|35')])" diagnostics="diagnostic_recordreference">
				Cannot have more than one PEFC certification (value of 34/35 in preceding ProductFormFeatureType).
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_productformfeature_pcw">
			<assert role="error" test="normalize-space() castable as xs:integer and number(normalize-space()) le 100" diagnostics="diagnostic_recordreference">
				Value of <value-of select="normalize-space()"/> in <name/> must be an integer percentage pre- or post-consumer waste.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_productformfeature_uncertifiedpcw">
			<extends rule="abstract_check_productformfeature_pcw"/>
			<assert role="error" test="parent::element()/parent::element()/onix:ProductFormFeature[normalize-space(onix:ProductFormFeatureType) = '30']" diagnostics="diagnostic_recordreference">
				Pre-or post-consumer waste percentage must be applied to an uncertified product (value of 30 in another ProductFormFeatureType)
			</assert>
		</rule>
	</pattern>

	<pattern id="check_date_microsyntaxes">
		<!-- secular (gregorian) calendar -->
		<rule context="//onix:Date[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:Date[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:Date[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:Date[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:Date[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:Date[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:Date[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:Date[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:Date[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:Date[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:Date[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:Date[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:Date[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:Date[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:Date[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:StartDate[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:StartDate[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:StartDate[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:StartDate[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:StartDate[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:StartDate[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:StartDate[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:StartDate[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:StartDate[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:StartDate[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:StartDate[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:StartDate[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:StartDate[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:StartDate[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:StartDate[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:EndDate[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:EndDate[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:EndDate[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:EndDate[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:EndDate[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:EndDate[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:EndDate[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:EndDate[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:EndDate[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:EndDate[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:EndDate[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:EndDate[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:EndDate[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:EndDate[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:EndDate[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '00']"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '01']"><extends rule="abstract_check_date_format_yyyymm"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '02']"><extends rule="abstract_check_date_format_yyyyww"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '03']"><extends rule="abstract_check_date_format_yyyyq"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '04']"><extends rule="abstract_check_date_format_yyyys"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '05']"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '06']"><extends rule="abstract_check_date_format_yyyymmddyyyymmdd"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '07']"><extends rule="abstract_check_date_format_yyyymmyyyymm"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '08']"><extends rule="abstract_check_date_format_yyyywwyyyyww"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '09']"><extends rule="abstract_check_date_format_yyyyqyyyyq"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '10']"><extends rule="abstract_check_date_format_yyyysyyyys"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '11']"><extends rule="abstract_check_date_format_yyyyyyyy"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '12']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '13']"><extends rule="abstract_check_date_format_YYYYMMDDThhmm"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '14']"><extends rule="abstract_check_date_format_YYYYMMDDThhmmss"/></rule>
		<!-- hijri calendar -->
		<rule context="//onix:Date[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:Date[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:Date[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:Date[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:Date[preceding-sibling::onix:DateFormat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:StartDate[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:StartDate[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:StartDate[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:StartDate[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:EndDate[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:EndDate[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:EndDate[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:EndDate[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:ThesisYear[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:ConferenceDate[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:CopyrightYear[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:ExpectedDate[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '20']"><extends rule="abstract_check_date_format_hijri_yyyymmdd"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '21']"><extends rule="abstract_check_date_format_hijri_yyyymm"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '25']"><extends rule="abstract_check_date_format_hijri_yyyy"/></rule>
		<rule context="//onix:ReissueDate[@dateformat = '32']"><let name="maxlen" value="100"/><extends rule="abstract_lib_check_string_length"/></rule>
		<!-- default -->
		<rule context="//onix:Date"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:StartDate"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:EndDate"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:ThesisYear"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:ConferenceDate"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:CopyrightYear"><extends rule="abstract_check_date_format_yyyy"/></rule>
		<rule context="//onix:ExpectedDate"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule context="//onix:ReissueDate"><extends rule="abstract_check_date_format_yyyymmdd"/></rule>
		<rule abstract="true" id="abstract_check_date_format_yyyymmdd">
			<assert role="error" test="matches(normalize-space(), '^(([012][0-9]{3}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-8]))|([012][0-9]{3}(0[13-9]|1[0-2])(29|30))|([012][0-9]{3}(0[13578]|1[02])31)|([02][048](0[048]|[13579][26]|[2468][048])0229)|([02][1235679](0[48]|[13579][26]|[2468][048])0229)|([1][26](0[048]|[13579][26]|[2468][048])0229)|([1][01345789](0[48]|[13579][26]|[2468][048])0229))$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the format YYYYMMDD.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyymm">
			<assert role="error" test="matches(normalize-space(), '^[012][0-9]{3}(0[1-9]|1[0-2])$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the format YYYYMM.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyyww">
			<assert role="error" test="matches(normalize-space(), '^[012][0-9]{3}([0-4][0-9]|5[0-3])$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the format YYYYWW.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyyq">
			<assert role="error" test="matches(normalize-space(), '^[012][0-9]{3}[1-4]$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the format YYYYQ.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyys">
			<assert role="error" test="matches(normalize-space(), '^[012][0-9]{3}[1-4]$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the format YYYYS.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyy">
			<assert role="error" test="matches(normalize-space(), '^[012][0-9]{3}$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the format YYYY.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyymmddyyyymmdd">
			<let name="format_okay" value="matches(normalize-space(), '^(([012][0-9]{3}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-8]))|([012][0-9]{3}(0[13-9]|1[0-2])(29|30))|([012][0-9]{3}(0[13578]|1[02])31)|([02][048](0[048]|[13579][26]|[2468][048])0229)|([02][1235679](0[48]|[13579][26]|[2468][048])0229)|([1][26](0[048]|[13579][26]|[2468][048])0229)|([1][01345789](0[48]|[13579][26]|[2468][048])0229)){2}$')"/>
			<assert role="error" test="$format_okay" diagnostics="diagnostic_recordreference">
				The date range <value-of select="normalize-space()"/> in <name/> does not match the format YYYYMMDDYYYYMMDD.
			</assert>
			<let name="date1" value="number(substring(normalize-space(), 1, 8))"/>
			<let name="date2" value="number(substring(normalize-space(), 9, 8))"/>
			<extends rule="abstract_check_date_order"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyymmyyyymm">
			<let name="format_okay" value="matches(normalize-space(), '^([012][0-9]{3}(0[1-9]|1[0-2])){2}$')"/>
			<assert role="error" test="$format_okay" diagnostics="diagnostic_recordreference">
				The date range <value-of select="normalize-space()"/> in <name/> does not match the format YYYYMMYYYYMM.
			</assert>
			<let name="date1" value="number(substring(normalize-space(), 1, 6))"/>
			<let name="date2" value="number(substring(normalize-space(), 7, 5))"/>
			<extends rule="abstract_check_date_order"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyywwyyyyww">
			<let name="format_okay" value="matches(normalize-space(), '^([012][0-9]{3}([0-4][0-9]|5[0-3])){2}$')"/>
			<assert role="error" test="$format_okay" diagnostics="diagnostic_recordreference">
				The date range <value-of select="normalize-space()"/> in <name/> does not match the format YYYYWWYYYYWW.
			</assert>
			<let name="date1" value="number(substring(normalize-space(), 1, 6))"/>
			<let name="date2" value="number(substring(normalize-space(), 7, 5))"/>
			<extends rule="abstract_check_date_order"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyyqyyyyq">
			<let name="format_okay" value="matches(normalize-space(), '^([012][0-9]{3}[1-4]){2}$')"/>
			<assert role="error" test="$format_okay" diagnostics="diagnostic_recordreference">
				The date range <value-of select="normalize-space()"/> in <name/> does not match the format YYYYQYYYYQ.
			</assert>
			<let name="date1" value="number(substring(normalize-space(), 1, 5))"/>
			<let name="date2" value="number(substring(normalize-space(), 6, 5))"/>
			<extends rule="abstract_check_date_order"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyysyyyys">
			<let name="format_okay" value="matches(normalize-space(), '^([012][0-9]{3}[1-4]){2}$')"/>
			<assert role="error" test="$format_okay" diagnostics="diagnostic_recordreference">
				The date range <value-of select="normalize-space()"/> in <name/> does not match the format YYYYSYYYYS.
			</assert>
			<let name="date1" value="number(substring(normalize-space(), 1, 5))"/>
			<let name="date2" value="number(substring(normalize-space(), 6, 5))"/>
			<extends rule="abstract_check_date_order"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_yyyyyyyy">
			<let name="format_okay" value="matches(normalize-space(), '^([012][0-9]{3}){2}$')"/>
			<assert role="error" test="$format_okay" diagnostics="diagnostic_recordreference">
				The date range <value-of select="normalize-space()"/> in <name/> does not match the format YYYYYYYY.
			</assert>
			<let name="date1" value="number(substring(normalize-space(), 1, 4))"/>
			<let name="date2" value="number(substring(normalize-space(), 5, 4))"/>
			<extends rule="abstract_check_date_order"/>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_YYYYMMDDThhmm">
			<assert role="error" test="matches(normalize-space(), '^(([012][0-9]{3}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-8]))|([012][0-9]{3}(0[13-9]|1[0-2])(29|30))|([012][0-9]{3}(0[13578]|1[02])31)|([02][048](0[048]|[13579][26]|[2468][048])0229)|([02][1235679](0[48]|[13579][26]|[2468][048])0229)|([1][26](0[048]|[13579][26]|[2468][048])0229)|([1][01345789](0[48]|[13579][26]|[2468][048])0229))T([01][0-9]|2[0-4])([0-5][0-9])(Z|[\+\-](0[0-9]|1[0-2])(00|15|30|45))?$')" diagnostics="diagnostic_recordreference">
				The date and time <value-of select="normalize-space()"/> in <name/> does not match the format YYYYMMDDThhmm(±hhmm).
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_YYYYMMDDThhmmss">
			<assert role="error" test="matches(normalize-space(), '^(([012][0-9]{3}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-8]))|([012][0-9]{3}(0[13-9]|1[0-2])(29|30))|([012][0-9]{3}(0[13578]|1[02])31)|([02][048](0[048]|[13579][26]|[2468][048])0229)|([02][1235679](0[48]|[13579][26]|[2468][048])0229)|([1][26](0[048]|[13579][26]|[2468][048])0229)|([1][01345789](0[48]|[13579][26]|[2468][048])0229))T([01][0-9]|2[0-4])([0-5][0-9]){2}(Z|[\+\-](0[0-9]|1[0-2])(00|15|30|45))?$')" diagnostics="diagnostic_recordreference">
				The date and time <value-of select="normalize-space()"/> in <name/> does not match the format YYYYMMDDThhmmss(±hhmm).
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_hijri_yyyymmdd">
			<assert role="error" test="matches(normalize-space(), '^[01][0-9]{3}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|30)$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the Hijri format YYYYMMDD.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_hijri_yyyymm">
			<assert role="error" test="matches(normalize-space(), '^[01][0-9]{3}(0[1-9]|1[0-2])$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the Hijri format YYYYMM.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_format_hijri_yyyy">
			<assert role="error" test="matches(normalize-space(), '^[01][0-9]{3}$')" diagnostics="diagnostic_recordreference">
				The date <value-of select="normalize-space()"/> in <name/> does not match the Hijri format YYYY.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_date_order">
			<assert role="error" test="not($format_okay) or $date2 gt $date1" diagnostics="diagnostic_recordreference">
				The date range in <name/> is not valid – <value-of select="$date2"/> must be later than <value-of select="$date1"/>.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_salesrights">
		<rule context="//onix:SalesRights[last()]"><extends rule="abstract_check_one_of_each_type"/><extends rule="abstract_check_for_sale_somewhere"/><extends rule="abstract_check_for_rest_of_world"/></rule>
		<rule context="//onix:SalesRights"><extends rule="abstract_check_one_of_each_type"/></rule>
		<rule context="//onix:SalesRights/onix:Territory"><extends rule="abstract_check_if_too_complex"/></rule>
		<rule context="//onix:SalesRights/onix:Territory/onix:CountriesIncluded"><extends rule="abstract_check_repeated_country"/><extends rule="abstract_check_not_repeating_world_in_country"/></rule>
		<rule context="//onix:SalesRights/onix:Territory/onix:RegionsIncluded"><extends rule="abstract_check_repeated_region"/><extends rule="abstract_check_not_repeating_world_in_region"/></rule>
		<rule abstract="true" id="abstract_check_one_of_each_type">
			<assert role="error" test="not(onix:SalesRightsType = preceding-sibling::onix:SalesRights/onix:SalesRightsType) and not(onix:SalesRightsType = following-sibling::onix:ROWSalesRightsType)" diagnostics="diagnostic_recordreference">
				There should be only one <name/> for each SalesRightsType (including ROWSalesRightsType).
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_for_sale_somewhere">
			<assert role="error" test="following-sibling::onix:SalesRights or preceding-sibling::onix:SalesRights[matches(onix:SalesRightsType, '01|02|07|08')] or matches(onix:SalesRightsType, '01|02|07|08') or following-sibling::onix:ROWSalesRightsType[matches(., '01|02|07|08')]" diagnostics="diagnostic_recordreference">
				The product should be for sale in at least one territory (including ROWSalesRightsType).
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_repeated_country">
			<assert role="error" test="every $country in tokenize(., ' ') satisfies not(parent::onix:Territory/parent::onix:SalesRights/preceding-sibling::onix:SalesRights/onix:Territory[matches(onix:CountriesIncluded, $country)])" diagnostics="diagnostic_recordreference">
				<name/> contains a country code included in a preceding SalesRights composite.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_repeated_region">
			<assert role="error" test="every $region in tokenize(., ' ') satisfies not(parent::onix:Territory/parent::onix:SalesRights/preceding-sibling::onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, $region)])" diagnostics="diagnostic_recordreference">
				<name/> contains a region code included in a preceding SalesRights composite.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_for_rest_of_world">
			<assert role="error" test="following-sibling::onix:ROWSalesRightsType or (onix:Territory[onix:RegionsIncluded = 'WORLD' and not(onix:CountriesExcluded) and not(onix:RegionsExcluded)]) or (parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[onix:RegionsIncluded = 'WORLD'] and (every $country in tokenize(parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[onix:RegionsIncluded = 'WORLD']/onix:CountriesExcluded, ' ') satisfies parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[matches(onix:CountriesIncluded, $country)]) and (every $region in tokenize(parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[onix:RegionsIncluded = 'WORLD']/onix:RegionsExcluded, ' ') satisfies parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, $region)]))" diagnostics="diagnostic_recordreference">
				ROWSalesRightsType must be included.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_not_repeating_world_in_country">
			<assert role="error" test="not(parent::onix:Territory/parent::onix:SalesRights/preceding-sibling::onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, '^WORLD$')] or parent::onix:Territory/parent::onix:SalesRights/following-sibling::onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, '^WORLD$')]) or (every $country in tokenize(., ' ') satisfies parent::onix:Territory/parent::onix:SalesRights/parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, '^WORLD$')]/onix:CountriesExcluded[matches(., $country)])" diagnostics="diagnostic_recordreference">
				<name/> includes countries that are already included in WORLD.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_not_repeating_world_in_region">
			<assert role="error" test="not(parent::onix:Territory/parent::onix:SalesRights/preceding-sibling::onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, '^WORLD$')] or parent::onix:Territory/parent::onix:SalesRights/following-sibling::onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, '^WORLD$')]) or (every $region in tokenize(., ' ') satisfies parent::onix:Territory/parent::onix:SalesRights/parent::onix:PublishingDetail/onix:SalesRights/onix:Territory[matches(onix:RegionsIncluded, '^WORLD$')]/onix:RegionsExcluded[matches(., $region)])" diagnostics="diagnostic_recordreference">
				<name/> includes regions that are already included in WORLD.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_if_too_complex">
			<assert role="warn" test="count(child::element()) le 2" diagnostics="diagnostic_recordreference">
				<name/> may be too complex to check fully.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_territories">
		<rule context="//onix:SalesRights/onix:Territory"><extends rule="abstract_check_CI_RI_CX_RX_pattern_in_territory"/></rule>
		<rule context="//onix:Market/onix:Territory"><extends rule="abstract_check_CI_RI_CX_RX_pattern_in_territory"/></rule>
		<rule context="//onix:Price/onix:Territory"><!-- //onix:Price/onix:Territory structure checked entirely in XSD --></rule>
		<rule context="//onix:SalesRights/onix:ProductIdentifier"><extends rule="abstract_check_not_for_sale_alternative_product"/></rule>
		<rule context="//onix:SalesRights/onix:PublisherName"><extends rule="abstract_check_not_for_sale_alternative_product"/></rule>
		<rule context="//onix:CountriesIncluded"><extends rule="abstract_check_repeated_country_or_region"/></rule>
		<rule context="//onix:RegionsIncluded"><extends rule="abstract_check_repeated_country_or_region"/><extends rule="abstract_check_world_included_solus"/><extends rule="abstract_check_regions_included_not_within_countries_included"/></rule>
		<rule context="//onix:CountriesExcluded"><extends rule="abstract_check_repeated_country_or_region"/></rule>
		<rule context="//onix:RegionsExcluded"><extends rule="abstract_check_repeated_country_or_region"/><extends rule="abstract_check_world_not_used"/><extends rule="abstract_check_regions_excluded_are_within_countries_included"/></rule>
		<rule abstract="true" id="abstract_check_not_for_sale_alternative_product">
			<assert role="error" test="preceding-sibling::onix:SalesRightsType[matches(., '03|04|05|06')]" diagnostics="diagnostic_recordreference">
				<name/> can only be used in territories the product is not for sale.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_repeated_country_or_region">
			<assert role="error" test="count(tokenize(., ' ')) = count(distinct-values(tokenize(., ' ')))" diagnostics="diagnostic_recordreference">
				<name/> contains a duplicated country or region code.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_world_included_solus">
			<assert role="error" test="matches(normalize-space(), '^WORLD$') or not(matches(., 'WORLD'))" diagnostics="diagnostic_recordreference">
				<name/> contains unnecessary region codes in addition to WORLD.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_regions_included_not_within_countries_included">
			<assert role="error" test="matches(normalize-space(), '^WORLD$') or (every $region in tokenize(., ' ') satisfies not(matches(preceding-sibling::onix:CountriesIncluded, substring($region, 1, 2))))" diagnostics="diagnostic_recordreference">
				<name/> contains unnecessary region codes in addition to the countries included.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_regions_excluded_are_within_countries_included">
			<assert role="error" test="preceding-sibling::onix:RegionsIncluded[matches(normalize-space(), '^WORLD$')] or (every $region in tokenize(., ' ') satisfies preceding-sibling::onix:CountriesIncluded[matches(. , substring($region, 1, 2))])" diagnostics="diagnostic_recordreference">
				<name/> contains unnecessary region codes that are not part of the countries included.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_world_not_used">
			<assert role="error" test="not(matches(., 'WORLD'))" diagnostics="diagnostic_recordreference">
				<name/> must not include WORLD.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_CI_RI_CX_RX_pattern_in_territory">
			<assert role="error" test=" (onix:CountriesIncluded and count(child::element()) = 1) or (onix:CountriesIncluded and onix:RegionsExcluded and count(child::element()) = 2) or (onix:RegionsIncluded and count(child::element()) = 1) or (onix:RegionsIncluded[matches(., 'WORLD')] and onix:RegionsExcluded and count(child::element()) = 2) or (onix:RegionsIncluded[matches(., 'WORLD')] and onix:CountriesExcluded and count(child::element()) = 2) or (onix:RegionsIncluded[matches(., 'WORLD')] and onix:CountriesExcluded and onix:RegionsExcluded and count(child::element()) = 3) or (onix:CountriesIncluded and onix:RegionsIncluded[not(matches(., 'WORLD'))] and count(child::element()) = 2) or (onix:CountriesIncluded and onix:RegionsIncluded[not(matches(., 'WORLD'))] and onix:RegionsExcluded and count(child::element()) = 3)" diagnostics="diagnostic_recordreference">
				<name/> must contain CI, CI+RX, RI, RI(WORLD)+RX, RI(WORLD)+CX, RI(WORLD)+CX+RX, CI+RI(not WORLD), or CI+RI(not WORLD)+RX.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_name_sequences">
		<rule context="//onix:Contributor/onix:SequenceNumber"><extends rule="abstract_check_sequence_number"/></rule>
		<rule abstract="true" id="abstract_check_sequence_number">
			<assert role="error" test="not(. = parent::onix:Contributor/preceding-sibling::onix:Contributor/onix:SequenceNumber)" diagnostics="diagnostic_recordreference">
				<name/> duplicates a previous <name/>.
			</assert>
			<assert role="error" test="not(. = parent::onix:Contributor/preceding-sibling::onix:Collection/onix:Contributor/onix:SequenceNumber)" diagnostics="diagnostic_recordreference">
				<name/> duplicates a previous <name/> in Collection.
			</assert>
			<assert role="error" test="number() le count(//onix:Contributor/onix:SequenceNumber)" diagnostics="diagnostic_recordreference">
				<name/> is too large (there is a break in the sequence).
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_websites">
		<rule context="//onix:Website[onix:WebsiteRole = '00']">
			<assert role="error" test="onix:WebsiteDescription" diagnostics="diagnostic_recordreference">
				Website must be described in WebsiteDescription.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_subjects">
		<rule context="//onix:Subject[onix:MainSubject and matches(onix:SubjectSchemeIdentifier, '23|24')]"><extends rule="abstract_check_only_one_main_subject_per_proprietary_scheme"/></rule>
		<rule context="//onix:Subject[onix:MainSubject]"><extends rule="abstract_check_only_one_main_subject_per_standard_scheme"/></rule>
		<rule context="//onix:Subject[matches(onix:SubjectSchemeIdentifier, '23|24')]"><extends rule="abstract_check_one_main_subject_per_proprietary_scheme"/></rule>
		<rule context="//onix:Subject"><extends rule="abstract_check_one_main_subject_per_standard_scheme"/></rule>
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '10']/onix:SubjectCode"><extends rule="abstract_check_bisac_subject"></extends></rule>
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '11']/onix:SubjectCode"><extends rule="abstract_check_bisac_regional_qualifier"></extends></rule>
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '12']/onix:SubjectCode"><extends rule="abstract_check_bic_subject"></extends></rule>
		<rule context="//onix:Subject[matches(onix:SubjectSchemeIdentifier, '13|14|15|16|17')]/onix:SubjectCode"><extends rule="abstract_check_bic_qualifier"/></rule>
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '29']/onix:SubjectCode"><extends rule="abstract_check_clil_subject"/></rule>
		<rule context="//onix:Subject[onix:SubjectSchemeIdentifier = '93']/onix:SubjectCode"><extends rule="abstract_check_thema_subject"/></rule>
		<rule context="//onix:Subject[matches(onix:SubjectSchemeIdentifier, '94|95|96|97|98|99')]/onix:SubjectCode"><extends rule="abstract_check_thema_qualifier"/></rule>
		<rule abstract="true" id="abstract_check_only_one_main_subject_per_standard_scheme">
			<assert role="error" test="not(preceding-sibling::onix:Subject[onix:MainSubject]/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier)" diagnostics="diagnostic_recordreference">
				There can only be one <name path="onix:MainSubject"/> for <name path="onix:SubjectSchemeIdentifier"/> <value-of select="onix:SubjectSchemeIdentifier"/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_one_main_subject_per_standard_scheme">
			<assert role="warn" test="not(preceding-sibling::onix:Subject/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier) or (preceding-sibling::onix:Subject[onix:MainSubject]/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier) or (following-sibling::onix:Subject/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier)" diagnostics="diagnostic_recordreference">
				There should be a MainSubject for <name path="onix:SubjectSchemeIdentifier"/> <value-of select="onix:SubjectSchemeIdentifier"/>.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_only_one_main_subject_per_proprietary_scheme">
			<assert role="error" test="not(preceding-sibling::onix:Subject[onix:MainSubject and normalize-space(onix:SubjectSchemeName) = normalize-space(current()/onix:SubjectSchemeName)]/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier)" diagnostics="diagnostic_recordreference">
				There can only be one <name path="onix:MainSubject"/> for <name path="onix:SubjectSchemeIdentifier"/> <value-of select="onix:SubjectSchemeIdentifier"/> (<value-of select="onix:SubjectSchemeName"/>).
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_one_main_subject_per_proprietary_scheme">
			<assert role="warn" test="not(preceding-sibling::onix:Subject[normalize-space(onix:SubjectSchemeName) = normalize-space(current()/onix:SubjectSchemeName)]/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier) or (preceding-sibling::onix:Subject[onix:MainSubject and normalize-space(onix:SubjectSchemeName) = normalize-space(current()/onix:SubjectSchemeName)]/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier) or (following-sibling::onix:Subject[normalize-space(onix:SubjectSchemeName) = normalize-space(current()/onix:SubjectSchemeName)]/onix:SubjectSchemeIdentifier = onix:SubjectSchemeIdentifier)" diagnostics="diagnostic_recordreference">
				There should be a MainSubject for <name path="onix:SubjectSchemeIdentifier"/> <value-of select="onix:SubjectSchemeIdentifier"/> (<value-of select="onix:SubjectSchemeName"/>).
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_bisac_subject">
			<assert role="error" test="matches(normalize-space(), '^[A-Z]{3}[0-9]{6}$') or matches(normalize-space(preceding-sibling::onix:SubjectSchemeVersion), '2012|2011|2010|2009')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed BISAC subject code.
			</assert>
			<assert role="error" test=". = $listBisac2012 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2012'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BISAC version 2012 subject code.
			</assert>
			<assert role="error" test=". = $listBisac2011 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2011'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BISAC version 2011 subject code.
			</assert>
			<assert role="error" test=". = $listBisac2010 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2010'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BISAC version 2010 subject code.
			</assert>
			<assert role="error" test=". = $listBisac2009 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2009'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BISAC version 2009 subject code.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_bisac_regional_qualifier">
			<assert role="error" test="matches(normalize-space(), '^([1-7](\.[0-9]){6})$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed BISAC regional qualifier code.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_bic_subject">
			<assert role="error" test="matches(normalize-space(), '^([A-Z]{1,3}|[A-Z]{4}[0-9]{0,4})$') or matches(normalize-space(preceding-sibling::onix:SubjectSchemeVersion), '2.1|2.0')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed BIC subject code.
			</assert>
			<assert role="error" test=". = $listBic2.1 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2.1'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BIC version 2.1 subject code.
			</assert>
			<assert role="error" test=". = $listBic2.0 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2.0'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BIC version 2.0 subject code.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_bic_qualifier">
			<assert role="error" test="matches(normalize-space(), '^[1-5][A-Z]{1,7}$') or matches(normalize-space(preceding-sibling::onix:SubjectSchemeVersion), '2.1|2.0')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed BIC subject qualifier.
			</assert>
			<assert role="error" test=". = $listBic2.1 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2.1'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BIC version 2.1 subject qualifier.
			</assert>
			<assert role="error" test=". = $listBic2.0 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2.0'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BIC version 2.0 subject qualifier.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_clil_subject">
			<assert role="error" test="matches(normalize-space(), '^(0000|[1-3][0-9]{3})$') or matches(normalize-space(preceding-sibling::onix:SubjectSchemeVersion), '2013|2010')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed CLIL subject code.
			</assert>
			<assert role="error" test=". = $listClil2013 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2013'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid CLIL version 2013 subject code.
			</assert>
			<assert role="error" test=". = $listClil2010 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '2010'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid CLIL version 2010 subject code.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_thema_subject">
			<assert role="error" test="matches(normalize-space(), '^([A-Z]{1,3}|[A-Z]{4}[0-9]{0,4})$') or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) = '0.9'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed Thema subject code.
			</assert>
			<assert role="error" test=". = $listThema0.9 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '0.9'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid Thema version 0.9 subject code.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_thema_qualifier">
			<assert role="error" test="matches(normalize-space(), '^[1-6][A-Z]([A-Z]{0,8}|[A-Z]{0,8}-[A-Z]{2}(-[A-Z]{1,8}){0,1})$') or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) = '0.9'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a well-formed Thema subject qualifier.
			</assert>
			<assert role="error" test=". = $listThema0.9 or normalize-space(preceding-sibling::onix:SubjectSchemeVersion) != '0.9'" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid Thema version 0.9 subject qualifier.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_audiences">
		<rule context="onix:Audience[onix:AudienceCodeType = '01']/onix:AudienceCodeValue"><extends rule="abstract_check_list28"/></rule>
		<rule context="onix:Audience[onix:AudienceCodeType = '19']/onix:AudienceCodeValue"><extends rule="abstract_check_lexile"/></rule>
		<rule context="onix:Audience[onix:AudienceCodeType = '20']/onix:AudienceCodeValue"><extends rule="abstract_check_fry_readability"/></rule>
		<rule context="onix:Audience[onix:AudienceCodeType = '22']/onix:AudienceCodeValue"><extends rule="abstract_check_list203"/></rule>
		<!-- ranges -->
		<rule context="onix:AudienceRange/onix:AudienceRangePrecision[preceding-sibling::onix:AudienceRangePrecision]"><extends rule="abstract_check_from_to"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '11']/onix:AudienceRangeValue"><extends rule="abstract_check_list77"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '15']/onix:AudienceRangeValue"><extends rule="abstract_check_is_positive_integer"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '16']/onix:AudienceRangeValue"><extends rule="abstract_check_is_positive_integer"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '17']/onix:AudienceRangeValue"><extends rule="abstract_check_is_positive_integer"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '18']/onix:AudienceRangeValue"><extends rule="abstract_check_is_positive_integer"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '26']/onix:AudienceRangeValue"><extends rule="abstract_check_list77"/></rule>
		<rule context="onix:AudienceRange[onix:AudienceRangeQualifier = '29']/onix:AudienceRangeValue"><extends rule="abstract_check_list77"/></rule>
		<rule abstract="true" id="abstract_check_list28">
			<assert role="error" test=".= $list28" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid ONIX audience code – see List 28.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list203">
			<assert role="error" test=". = $list203" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid ONIX adult audience rating – see List 203.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list77">
			<assert role="error" test=". = $list77" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid school grade – see List 77.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_lexile">
			<assert role="error" test="matches(normalize-space(), '^(AD|NC|HL|IG|GN|BR|NP)?[0-9]{1,4}L$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> in <name/> is not a valid Lexile code.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_fry_readability">
			<assert role="error" test="matches(normalize-space(), '^([1-9]|1[0-5])$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> in <name/> is not a valid Fry Readability code.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_is_positive_integer">
			<assert role="error" test="(. castable as xs:integer) and matches(normalize-space(), '^[^-]')" diagnostics="diagnostic_recordreference">
				<value-of select="."/> in <name/> must be positive.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_from_to">
			<!-- does not check that From is 'lower' than To -->
			<assert role="error" test="matches(., '04') and matches(preceding-sibling::onix:AudienceRangePrecision, '03')" diagnostics="diagnostic_recordreference">
				<name/>  must have the structure Exact, From, To, or From…To.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_measure">
		<rule id="_1110" context="//onix:Measure[onix:MeasureType = '08']"><extends rule="abstract_check_weight_unit"/></rule>
		<rule id="_1111" context="//onix:Measure"><extends rule="abstract_check_length_unit"/></rule>
		<rule abstract="true" id="abstract_check_weight_unit">
			<assert role="error" test="matches(onix:MeasureUnitCode, 'gr|kg|oz|lb')" diagnostics="diagnostic_recordreference">
				<name/> requires a unit of weight.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_length_unit">
			<assert role="error" test="matches(onix:MeasureUnitCode, 'mm|cm|in')" diagnostics="diagnostic_recordreference">
				<name/> requires a unit of length.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_returns">
		<rule context="//onix:ReturnsConditions[onix:ReturnsCodeType = '02']/onix:ReturnsCode"><extends rule="abstract_check_list66"/></rule>
		<rule context="//onix:ReturnsConditions[onix:ReturnsCodeType = '04']/onix:ReturnsCode"><extends rule="abstract_check_list204"/></rule>
		<rule abstract="true" id="abstract_check_list66">
			<assert role="error" test=". = $list66" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid BISAC returns code – see List 66.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_list204">
			<assert role="error" test=". = $list204" diagnostics="diagnostic_recordreference">
				Code <value-of select="normalize-space()"/> in <name/> is not a valid returns code – see List 204.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_extents">
		<rule context="onix:Extent[onix:ExtentType = '02']"><extends rule="abstract_check_words_unit"/></rule>
		<rule context="onix:Extent[matches(onix:ExtentType, '09|13|14')]"><extends rule="abstract_check_duration_unit"/></rule>
		<rule context="onix:Extent[onix:ExtentType = '22']"><extends rule="abstract_check_bytes_unit"/></rule>
		<rule context="onix:Extent"><extends rule="abstract_check_pages_unit"/></rule>
		<rule abstract="true" id="abstract_check_words_unit">
			<assert role="error" test="onix:ExtentUnit = '02'" diagnostics="diagnostic_recordreference">
				<name/> requires a count of words.
			</assert>
			<assert role="error" test="onix:ExtentValue castable as xs:integer" diagnostics="diagnostic_recordreference">
				<name path="onix:ExtentValue"/> must be an integer.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_duration_unit">
			<assert role="error" test="matches(onix:ExtentUnit, '04|05|06|14|15|16')" diagnostics="diagnostic_recordreference">
				<name/> requires a unit of duration.
			</assert>
			<assert role="error" test="onix:ExtentUnit != '14' or matches(onix:ExtentValue, '[0-9]{3}')" diagnostics="diagnostic_recordreference">
				<name path="onix:ExtentValue"/> must match HHH.
			</assert>
			<assert role="error" test="onix:ExtentUnit != '15' or matches(onix:ExtentValue, '[0-9]{3}[0-5][0-9]')" diagnostics="diagnostic_recordreference">
				<name path="onix:ExtentValue"/> must match HHHMM.
			</assert>
			<assert role="error" test="onix:ExtentUnit != '16' or matches(onix:ExtentValue, '[0-9]{3}[0-5][0-9][0-5][0-9]')" diagnostics="diagnostic_recordreference">
				<name path="onix:ExtentValue"/> must match HHHMMSS.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_bytes_unit">
			<assert role="error" test="matches(onix:ExtentUnit, '17|18|19')" diagnostics="diagnostic_recordreference">
				<name/> requires a unit of file size.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_pages_unit">
			<assert role="error" test="onix:ExtentUnit = '03'" diagnostics="diagnostic_recordreference">
				<name/> requires a count of pages.
			</assert>
			<assert role="error" test="not(onix:ExtentValue) or onix:ExtentValue castable as xs:integer" diagnostics="diagnostic_recordreference">
				<name path="onix:ExtentValue"/> must be an integer.
			</assert>
		</rule>
	</pattern>

	<pattern id="check_structure_of_multiitem_products">
		<rule context="//onix:DescriptiveDetail/onix:ProductForm[matches(., 'SB|SC|SD|SE|SF')]"><extends rule="abstract_check_is_multiitem"/></rule>
		<rule context="//onix:DescriptiveDetail/onix:ProductForm[. = 'SA']"><extends rule="abstract_check_is_multiitem_or_collection"/></rule>
		<rule context="//onix:DescriptiveDetail/onix:ProductForm[matches(., 'XB|XD|XF|XG|XH|XI|XJ|XK|XZ')]"><extends rule="abstract_check_is_tradeonly"/></rule>
		<rule context="//onix:DescriptiveDetail/onix:ProductForm[matches(., 'XC|XE|XL')]"><extends rule="abstract_check_is_multipack"/></rule>
		<rule context="//onix:DescriptiveDetail/onix:ProductForm[. = 'XA']"><extends rule="abstract_check_is_tradeonly_or_multipack"/></rule>
		<rule context="//onix:DescriptiveDetail/onix:ProductForm"><extends rule="abstract_check_is_singleitem"/></rule>
		<rule abstract="true" id="abstract_check_is_singleitem">
			<assert role="error" test="preceding-sibling::onix:ProductComposition = '00'" diagnostics="diagnostic_recordreference">
				A single-item product must have a ProductComposition code 00.
			</assert>
			<extends rule="abstract_check_product_has_no_parts"/>
		</rule>
		<rule abstract="true" id="abstract_check_is_multiitem">
			<assert role="error" test="preceding-sibling::onix:ProductComposition = '10'" diagnostics="diagnostic_recordreference">
				A multi-item product must have ProductForm code S* and ProductComposition code 10.
			</assert>
			<extends rule="abstract_check_product_has_parts"/>
		</rule>
		<rule abstract="true" id="abstract_check_is_multiitem_or_collection">
			<assert role="error" test="matches(preceding-sibling::onix:ProductComposition, '10|11')" diagnostics="diagnostic_recordreference">
				A multi-item product must have ProductForm code SA and ProductComposition code 10 or 11.
			</assert>
			<extends rule="abstract_check_product_has_parts"/>
		</rule>
		<rule abstract="true" id="abstract_check_is_tradeonly">
			<assert role="error" test="preceding-sibling::onix:ProductComposition = '20'" diagnostics="diagnostic_recordreference">
				A trade-only product must have a ProductForm code X* and ProductComposition code 20. 
			</assert>
			<extends rule="abstract_check_product_has_no_parts"/>
		</rule>
		<rule abstract="true" id="abstract_check_is_multipack">
			<assert role="error" test="preceding-sibling::onix:ProductComposition = '30'" diagnostics="diagnostic_recordreference">
				A multi-item pack must have a ProductForm code X* and ProductComposition code 30.
			</assert>
			<extends rule="abstract_check_product_has_parts"/>
		</rule>
		<rule abstract="true" id="abstract_check_is_tradeonly_or_multipack">
			<assert role="error" test="matches(preceding-sibling::onix:ProductComposition, '20|30')" diagnostics="diagnostic_recordreference">
				A trade-only product must have a ProductForm code XA and ProductComposition code 20 or 30.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_product_has_parts">
			<assert role="error" test="following-sibling::onix:ProductPart" diagnostics="diagnostic_recordreference">
				A multi-part product must have one or more ProductPart composites.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_product_has_no_parts">
			<assert role="error" test="not(following-sibling::onix:ProductPart)" diagnostics="diagnostic_recordreference">
				A single-part product must not have a ProductPart composite.
			</assert>
		</rule>
	</pattern>
	
	<pattern id="check_general_header">
		<rule context="//onix:Header/onix:DefaultLanguageOfText">
			<assert role="warn" test="//onix:Product[not(onix:DescriptiveDetail/onix:Language/onix:LanguageRole = '01')]" diagnostics="diagnostic_recordreference">
				<name/> is unnecessary and should be removed, as every Product record in the message has an explicit Language composite with LanguageRole 01.
			</assert>
		</rule>
		<rule context="//onix:Header/onix:DefaultPriceType">
			<assert role="warn" test="//onix:Price[not(onix:PriceType)]" diagnostics="diagnostic_recordreference">
				<name/> is unnecessary and should be removed, as every Price in the message has an explicit Price type.
			</assert>
		</rule>
		<rule context="//onix:Header/onix:DefaultCurrencyCode">
			<assert role="warn" test="//onix:Price[not(onix:CurrencyCode)]" diagnostics="diagnostic_recordreference">
				<name/> is unnecessary and should be removed, as every Price has an explicit CurrencyCode.
			</assert>
		</rule>
	</pattern>
	
	<pattern id="check_general_group_p1">
		<rule id="_1034" context="//onix:Product[matches(onix:NotificationType, '01|02|03')]">
			<extends rule="abstract_check_mandatory_descriptivedetail"/>
			<extends rule="abstract_check_mandatory_publishingdetail"/>
			<extends rule="abstract_check_expected_productsupply"/>
		</rule>
		<rule id="_1035" context="//onix:Product[onix:NotificationType = '09']">
			<extends rule="abstract_check_expected_descriptivedetail"/>
			<extends rule="abstract_check_expected_publishingdetail"/>
			<extends rule="abstract_check_expected_productsupply"/>
		</rule>
		<rule id="_1002" context="//onix:NotificationType[. = '05']">
			<assert role="warn" test="following-sibling::onix:DeletionText">
				If <name/> shows the record is a deletion, <name path="following-sibling::onix:DeletionText"/> is expected.
			</assert>
		</rule>
		<rule id="_1004" context="//onix:DeletionText">
			<assert role="error" test="preceding-sibling::onix:DeletionText or preceding-sibling::onix:NotificationType = '05'" diagnostics="diagnostic_recordreference">
				<name/> must only occur if <name path="preceding-sibling::onix:NotificationType"/> shows the record is a deletion.
			</assert>			
		</rule>
		<rule abstract="true" id="abstract_check_mandatory_descriptivedetail">
			<assert role="error" test="onix:DescriptiveDetail" diagnostics="diagnostic_recordreference">
				<name/> must contain a DescriptiveDetail composite.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_expected_descriptivedetail">
			<assert role="warn" test="onix:DescriptiveDetail" diagnostics="diagnostic_recordreference">
				<name/> should contain a DescriptiveDetail composite.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_mandatory_publishingdetail">
			<assert role="error" test="onix:PublishingDetail" diagnostics="diagnostic_recordreference">
				<name/> must contain a PublishingDetail composite.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_expected_publishingdetail">
			<assert role="warn" test="onix:PublishingDetail" diagnostics="diagnostic_recordreference">
				<name/> should contain a PublishingDetail composite.
			</assert>
		</rule>
 		<rule abstract="true" id="abstract_check_expected_productsupply">
			<assert role="warn" test="onix:ProductSupply" diagnostics="diagnostic_recordreference">
				<name/> should contain a ProductSupply composite.
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_p2">
		<rule id="_1032" context="//onix:Barcode[onix:BarcodeType = '00']">
			<assert role="error" test="not(preceding-sibling::onix:Barcode[onix:BarcodeType != '00'])">
				Preceding <name/> indicates product is barcoded.
			</assert>
			<assert role="error" test="preceding-sibling::onix:Barcode[onix:BarcodeType != '00'] or not(onix:PositionOnProduct)" diagnostics="diagnostic_recordreference">
				For products which are not barcoded, <name/> must not include PositionOnProduct.
			</assert>
		</rule>
		<rule id="_1033" context="//onix:Barcode">
			<assert role="error" test="not(preceding-sibling::onix:Barcode[onix:BarcodeType = '00'])">
				Preceding <name/> indicates product is not barcoded.
			</assert>
			<assert role="error" test="preceding-sibling::onix:Barcode[onix:BarcodeType = '00'] or onix:PositionOnProduct" diagnostics="diagnostic_recordreference">
				For products which are barcoded, <name/> must include its position on the product.
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_3">
		<rule context="//onix:EpubTechnicalProtection"><extends rule="abstract_check_is_electronic_product"/></rule>
		<rule context="//onix:EpubUsageConstraint"><extends rule="abstract_check_is_electronic_product"/></rule>
		<rule id="_1042" context="//onix:ProductPackaging"><extends rule="abstract_check_is_physical_product"/></rule>
		<rule context="//onix:ProductContentType"><extends rule="abstract_check_repetition_of_primary_content_type"/></rule>
		<rule context="//onix:Measure"><extends rule="abstract_check_is_physical_product"/></rule>
		<rule context="//onix:CountryOfManufacture"><extends rule="abstract_check_is_physical_product"/></rule>
		<rule abstract="true" id="abstract_check_is_electronic_product">
			<assert role="error" test="matches(preceding-sibling::onix:ProductForm, 'A[^BF]|D.|E.|LC')" diagnostics="diagnostic_recordreference">
				Only digital products can carry technical protection (DRM).
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_is_physical_product">
			<assert role="error" test="not(matches(preceding-sibling::onix:ProductForm, 'AJ|E.|LC'))" diagnostics="diagnostic_recordreference">
				Only physical products can have measurements, packaging or a country of manufacture.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_repetition_of_primary_content_type">
			<assert role="error" test="not(preceding-sibling::onix:PrimaryContentType = .)" diagnostics="diagnostic_recordreference">
				<name/> duplicates a preceding PrimaryContentType.
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_p4">
		<rule context="//onix:ProductPart">
			<assert role="error" test="not(onix:NumberOfItemsOfThisForm and onix:ProductIdentifier)" diagnostics="diagnostic_recordreference">
				<name path="onix:NumberOfItemsOfThisForm"/> cannot be used with <name path="onix:ProductIdentifier"/>
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_6">
		<rule id="_1036" context="//onix:DescriptiveDetail">
			<assert role="warn" test="onix:TitleDetail[matches(onix:TitleType, '00|01|05|10|13')]/onix:TitleElement[onix:TitleElementLevel = '01']" diagnostics="diagnostic_recordreference">
				There must be some kind of primary product-level title.
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_p7">
		<rule context="//onix:FromLanguage"><extends rule="abstract_check_role_is_translator"/></rule>
		<rule context="//onix:ToLanguage"><extends rule="abstract_check_role_is_translator"/></rule>
		<rule abstract="true" id="abstract_check_role_is_translator">
			<assert role="error" test="matches(preceding-sibling::onix:ContributorRole, 'B06|B08|B10')" diagnostics="diagnostic_recordreference">
				<name/> is only used with a translator (role code B06, B08 or B10).
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_20">
		<rule context="//onix:PublishingStatus[matches(., '01|03')]"><extends rule="abstract_check_no_pub_date"/></rule>
		<rule context="//onix:PublishingStatus[. = '02']"><extends rule="abstract_check_pub_date"/></rule>
		<rule abstract="true" id="abstract_check_no_pub_date">
			<assert role="error" test="not(following-sibling::onix:PublishingDate[onix:PublishingDateRole = '01'])" diagnostics="diagnostic_recordreference">
				The cancelled publication date must not be included.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_check_pub_date">
			<assert role="error" test="following-sibling::onix:PublishingDate[onix:PublishingDateRole = '01']" diagnostics="diagnostic_recordreference">
				The publication date must be included.
			</assert>
		</rule>
	</pattern>

	<pattern id="general_group_26">
		<rule context="//onix:DiscountCoded[onix:DiscountCodeType = '01']/onix:DiscountCode"><extends rule="abstract_check_bic_discount_code"/></rule>
		<rule context="//onix:Price[matches(onix:PriceType, '02|04|07|09|12|14|17|22|24|27|42')]"><extends rule="abstract_check_price_type_and_currency_inc_tax"/></rule>
		<rule context="//onix:Price[not(onix:PriceType) and matches(//onix:DefaultPriceType, '02|04|07|09|12|14|17|22|24|27|42')]"><extends rule="abstract_check_price_type_and_currency_inc_tax"/></rule>
		<rule context="//onix:Price"><extends rule="abstract_check_price_type_and_currency_exc_tax"/></rule>
		<rule abstract="true" id="abstract_check_bic_discount_code">
			<assert role="error" test="matches(normalize-space(), '^A[A-Z]{4}[0-9]{3}$')" diagnostics="diagnostic_recordreference">
				<value-of select="normalize-space()"/> is not a valid BIC discount group code.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_check_price_type_and_currency_exc_tax">
			<assert role="warn" test="not(onix:Tax)" diagnostics="diagnostic_recordreference">
				There should not be tax details for tax-exclusive prices.
			</assert>
			<extends rule="abstract_check_price_type_and_currency"/>
		</rule>
		<rule abstract="true" id="abstract_check_price_type_and_currency_inc_tax">
			<assert role="warn" test="onix:Tax" diagnostics="diagnostic_recordreference">
				There should be tax details for tax-inclusive prices.
			</assert>
			<extends rule="abstract_check_price_type_and_currency"/>
		</rule>
		<rule abstract="true" id="abstract_check_price_type_and_currency">
			<assert role="error" test="onix:PriceType or //onix:DefaultPriceType" diagnostics="diagnostic_recordreference">
				Either PriceType must be included, or a DefaultPriceType set in the Header. 
			</assert>
			<assert role="error" test="onix:CurrencyCode or //onix:DefaultCurrencyCode" diagnostics="diagnostic_recordreference">
				Either CurrencyCode must be included, or a DefaultCurrencyCode set in the Header. 
			</assert>
		</rule>
	</pattern>

	<pattern id="abstract_lib">
		<rule abstract="true" id="abstract_lib_check_string_length">
			<assert role="warn" test="string-length() le $maxlen" diagnostics="diagnostic_recordreference">
				Length of <name/> is longer than the suggested maximum of <value-of select="$maxlen"/> characters.
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
			<extends rule="abstract_lib_check_multiple_internal_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_lib_unchecked_string_length">
			<assert role="warn" test="string-length() le $maxlen" diagnostics="diagnostic_recordreference">
				Length of <name/> is extremely long (more than <value-of select="$maxlen"/> characters).
			</assert>
			<extends rule="abstract_lib_check_leading_and_trailing_whitespace"/>
			<extends rule="abstract_lib_check_multiple_internal_whitespace"/>
		</rule>
		<rule abstract="true" id="abstract_lib_check_leading_and_trailing_whitespace">
			<assert role="warn" test="matches(., '^\S')" diagnostics="diagnostic_recordreference">
				<name/> begins with unnecessary whitespace, which will almost certainly be ignored by the recipient.
			</assert>
			<assert role="warn" test="matches(., '\S$')" diagnostics="diagnostic_recordreference">
				<!-- does not detect a line feed as the last character of an element (with oXygen) -->
				<name/> ends with unnecessary whitespace, which will almost certainly be ignored by the recipient.
			</assert>
		</rule>
		<rule abstract="true" id="abstract_lib_check_multiple_internal_whitespace">
			<assert role="warn" test="not(matches(., '\S\s\s+\S'))" diagnostics="diagnostic_recordreference">
				<name/> includes multiple consecutive whitespace characters, which will almost certainly be ignored by the recipient. 
			</assert>
		</rule>
	</pattern>

	<!-- co-occurence between product form, product form feature -->
	<!-- co-occurence between product form, extent -->
	<!-- co-occurence between EditionType PRB and publisher role 12 -->

	<!-- BP DeletionText exists if NotificationType = 05 -->
	<!-- BP RecordSourceType exists -->
	<!-- BP one or both of RecordSourceIdentifier and RecordSourceName -->
	<!-- BP if one contributor has a sequence number, all should have sequence numbers -->
	<!-- BP a name identifier is not enough on its own -->
	<!-- BP granular names better than monolithic -->
	<!-- BP inverted names better than natural order -->
	<!-- BP weblink should inlcude protocol -->
	<!-- BP simple XHTML tags only -->

	<diagnostics>
		<diagnostic id="diagnostic_recordreference">
			Product RecordReference <value-of select="ancestor::*/onix:RecordReference"/>
		</diagnostic>
	</diagnostics>


</schema>