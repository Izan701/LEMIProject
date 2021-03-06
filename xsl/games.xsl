<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="gamePassXML" select="document('../xml/gamePass.xml')"/>
    <xsl:template match="/">
        <xsl:element name="html">

            <xsl:element name="head">
                <xsl:element name="link">
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="href">../assets/css/main.css</xsl:attribute>
                    <title>UD6: Proyecto dirigido a la validación, formateo y transformación de documentos XML</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">

                <!-- Header -->
				<header id="header">
					<div class="inner">
						<a href="../index.html" class="logo">Xbox Game Pass</a>
						<nav id="nav">
							<a href="../index.html">Home page</a>
							<a href="full_catalog.xml">Our catalog</a>
							<a href="#">Game catalog</a>
							<a href="../web/contact.html">Contact</a>								
						</nav>
					</div>
				</header>
				<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

				<!-- Main -->
				<xsl:element name="section">
					<xsl:attribute name="id">main</xsl:attribute>

					<!-- inner div -->
					<xsl:element name="div">
						<xsl:attribute name="class">inner</xsl:attribute>
						<header class="major special">
							<h1>Xbox Game Pass</h1>
							<p>Game list</p>
						</header>

						<xsl:variable name="vat">
							<xsl:value-of select="$gamePassXML/gamePass/vat"/>
						</xsl:variable>
						<xsl:variable name="disc">
							<xsl:value-of select="$gamePassXML/gamePass/discount"/>
						</xsl:variable>

						<xsl:element name="table">
							<caption>VIDEOGAMES</caption>

							<thead>
								<xsl:element name="tr">
									<xsl:element name="th"></xsl:element>
									<xsl:element name="th">Game</xsl:element>
									<xsl:element name="th">Platform</xsl:element>
									<xsl:element name="th">Price (Including VAT)</xsl:element>
									<xsl:element name="th">Game Pass price</xsl:element>
									<!-- <xsl:element name="th">Date released</xsl:element> -->
									<!-- <xsl:element name="th">Developer</xsl:element> -->
									<!-- <xsl:element name="th">Publisher</xsl:element> -->
									<xsl:element name="th">Reviews</xsl:element>
								</xsl:element>
							</thead>
							
							<xsl:for-each select="$gamePassXML/gamePass/games/game">
								<xsl:sort select="name" order="ascending"/>

								<xsl:element name="tr">
									<xsl:element name="td">
										<xsl:element name="img">
											<xsl:attribute name="src"><xsl:value-of select="image"/></xsl:attribute>
											<xsl:attribute name="width">180px</xsl:attribute>
										</xsl:element>
									</xsl:element>

									<xsl:variable name="price"><xsl:value-of select="price"/></xsl:variable>
									
									<xsl:element name="td"><xsl:value-of select="name"/></xsl:element>

									<xsl:element name="td">

										<xsl:element name="ul">
											<xsl:for-each select="platforms/platform">
												<li><xsl:value-of select="current()"/></li>
											</xsl:for-each>
										</xsl:element>
									
									</xsl:element>

									<!-- Condition when a game is free -->
									<xsl:choose>
										<xsl:when test="price > 0">
											<xsl:element name="td"><xsl:value-of select="concat(format-number($price + ($price * $vat div 100),'#.##'), price/@currency)"/></xsl:element>
											
											<xsl:element name="td">

											<xsl:choose>
												<xsl:when test="($price * $vat div 100 * $disc) >= 9.99">
													<div class="discount"><xsl:value-of select="concat(format-number(($price + ($price * $vat div 100)) * $disc,'#.##'), price/@currency)"/></div>
													<div class="discountGreen">Incredible discount!</div>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat(format-number(($price + ($price * $vat div 100)) * $disc,'#.##'), price/@currency)"/>
												</xsl:otherwise>
											</xsl:choose>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="td"><xsl:value-of select="$price"/></xsl:element>
											<xsl:element name="td"><xsl:value-of select="$price"/></xsl:element>									
										</xsl:otherwise>
									</xsl:choose>

									<!-- <xsl:element name="td"><xsl:value-of select="release"/></xsl:element> -->
									<!-- <xsl:element name="td"><xsl:value-of select="dev"/></xsl:element> -->
									<!-- <xsl:element name="td"><xsl:value-of select="publisher"/></xsl:element> -->
									<xsl:element name="td">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="review"/>
											</xsl:attribute>
											<xsl:attribute name="target">_blank</xsl:attribute>
											Check Metacritic!
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
							<xsl:element name="tr">
								<th>Total games:</th>
								<xsl:element name="td">
									<xsl:value-of select="count($gamePassXML/gamePass/games/game)"></xsl:value-of>
								</xsl:element>
							</xsl:element>

						</xsl:element>

					</xsl:element>

				</xsl:element>
				

				<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<div class="copyright">
							© 2022 Aritz Velasco, Izan Jabón, Michal Michajlowski
							<ul class="icons">
								<li><a href="https://www.twitter.com" class="icon fa-twitter" target="blank"><span class="label">Twitter</span></a></li>
								<li><a href="https://www.facebook.com" class="icon fa-facebook"><span class="label" target="blank">Facebook</span></a></li>
								<li><a href="https://www.instagram.com/" class="icon fa-instagram"><span class="label" target="blank">Instagram</span></a></li>
								<li><a href="https://www.github.com/" class="icon fa-github"><span class="label" target="blank">Github</span></a></li>
								<li><a href="https://www.dribble.com/" class="icon fa-dribbble"><span class="label" target="blank">Dribbble</span></a></li>
								<li><a href="https://www.tumblr.com/" class="icon fa-tumblr"><span class="label" target="blank">Tumblr</span></a></li>
							</ul>
							Xbox
						</div>
					</div>
				</footer>

				<!-- Scripts -->
				<script src="assets/js/jquery.min.js"></script>
				<script src="assets/js/skel.min.js"></script>
				<script src="assets/js/util.js"></script>
				<script src="assets/js/main.js"></script>

				</xsl:element>

        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
