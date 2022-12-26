<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:template match="/">
	<fo:root>
	
		<fo:layout-master-set>
			<fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="template">
				<fo:region-body margin="20mm 0mm 20mm 0mm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>

<!--===========================Title===============================-->

        <fo:page-sequence master-reference="template">
			<fo:flow flow-name="xsl-region-body">
				<fo:block position ="absolute" text-align ="center" font-weight="bold" margin-bottom="50mm"
					font-family="Calibri" font-size="48pt" padding-before="50mm" color="black">
					Football teams catalog
				</fo:block>
			</fo:flow>
		</fo:page-sequence>

        <xsl:for-each select="//league">
        	<fo:page-sequence master-reference="template">
			<fo:flow flow-name="xsl-region-body">
				<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
					<fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
								font-family="Calibri" font-size="20pt" color="black">
						<xsl:value-of select="name"/>
<!--                        Leagues:-->
					</fo:block>
					
					<fo:block position="absolute" text-align="center" padding-before="7mm" margin-left="2.5cm">
						<fo:external-graphic src="{unparsed-entity-uri(logo/@src)}" content-height="scale-to-fit"
											 height="250px" content-width="700px"/>
					</fo:block>
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Name:
						<fo:inline position="relative" padding-left="32mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="name"/> 
						</fo:inline>
					</fo:block> 
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Country:
						<fo:inline position="relative" padding-left="10mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="country"/> 
						</fo:inline>
					</fo:block>
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Number of teams:
						<fo:inline position="relative" padding-left="31mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="number_of_teams"/> 
						</fo:inline>
					</fo:block> 
                    
                    <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Founded:
						<fo:inline position="relative" padding-left="31mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="founded"/> 
						</fo:inline>
					</fo:block> 
                    <!--current champion-->
				</fo:block-container>
			</fo:flow>
		</fo:page-sequence>
		</xsl:for-each>


<!--ot tuka teams-->
        <fo:page-sequence master-reference="template">
			<fo:flow flow-name="xsl-region-body">
				<fo:block position ="absolute" text-align ="center" font-weight="bold" margin-bottom="50mm"
					font-family="Calibri" font-size="30pt" padding-before="50mm" color="black">
					Football teams
				</fo:block>
			</fo:flow>
		</fo:page-sequence>

        <xsl:for-each select="//football_team">
			<xsl:variable name="coach_reference_id" select="@coachRef"/>
			<xsl:variable name="league_reference_id" select="@leagueRef"/>
        	<fo:page-sequence master-reference="template">
			<fo:flow flow-name="xsl-region-body">
				<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
					<fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
								font-family="Calibri" font-size="20pt" color="black">
						<xsl:value-of select="name"/>
					</fo:block>
					
					<fo:block position="absolute" text-align="center" padding-before="7mm" margin-left="2.5cm">
						<fo:external-graphic src="{unparsed-entity-uri(logo/@src)}" content-height="scale-to-fit"
											 height="250px" content-width="700px"/>
					</fo:block>
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Founded:
						<fo:inline position="relative" padding-left="32mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="founded"/> 
						</fo:inline>
					</fo:block> 
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Stadium:
						<fo:inline position="relative" padding-left="10mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="stadium"/> 
						</fo:inline>
					</fo:block>

					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Coach:
						<fo:inline position="relative" padding-left="27mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="//coach[@id = $coach_reference_id ]/name"/>
						</fo:inline>
					</fo:block>
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Competition:
						<fo:inline position="relative" padding-left="27mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="//league[@id = $league_reference_id]/name"/>
						</fo:inline>
					</fo:block>
				
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Description:
						<fo:inline position="relative" padding-left="31mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="description"/> 
						</fo:inline>
					</fo:block> 
                    <!--moze da se dodade location i captain-->
				</fo:block-container>
			</fo:flow>
		</fo:page-sequence>
		</xsl:for-each>

<!--ot tuka coaches-->
        <fo:page-sequence master-reference="template">
			<fo:flow flow-name="xsl-region-body">
				<fo:block position ="absolute" text-align ="center" font-weight="bold" margin-bottom="50mm"
					font-family="Calibri" font-size="30pt" padding-before="50mm" color="black">
					Football team coaches
				</fo:block>
			</fo:flow>
		</fo:page-sequence>

		
		<xsl:for-each select="//coach">
			<xsl:variable name="team_reference_id" select="@teamRef"/>
        	<fo:page-sequence master-reference="template">
			<fo:flow flow-name="xsl-region-body">
				<fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
					<fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
								font-family="Calibri" font-size="20pt" color="black">
						<xsl:value-of select="name"/>
					</fo:block>
					
					<fo:block position="absolute" text-align="center" padding-before="7mm" margin-left="2.5cm">
						<fo:external-graphic src="{unparsed-entity-uri(photo/@src)}" content-height="scale-to-fit"
											 height="250px" content-width="700px"/>
					</fo:block>
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Birth date:
						<fo:inline position="relative" padding-left="32mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="birth_date"/> 
						</fo:inline>
					</fo:block> 
					
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Coach since:
						<fo:inline position="relative" padding-left="10mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="coach_since"/> 
						</fo:inline>
					</fo:block>

					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Coach of:
						<fo:inline position="relative" padding-left="27mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="//football_team[@id = $team_reference_id ]/name"/>
						</fo:inline>
					</fo:block>
				<!--
					<fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="15pt" color="black" 
					padding-before="5mm" margin-left="2cm">
						Description:
						<fo:inline position="relative" padding-left="31mm" font-weight="normal" font-size="14pt">
							<xsl:value-of select="description"/> 
						</fo:inline>
					</fo:block> 
                -->
				</fo:block-container>
			</fo:flow>
		</fo:page-sequence>
		</xsl:for-each>
	</fo:root>

</xsl:template>

</xsl:stylesheet>
		