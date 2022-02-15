<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <xsl:element name="html">

            <xsl:element name="head">
                <xsl:element name="link">
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="href">assets/css/main.css</xsl:attribute>
                    <title>UD6: Proyecto dirigido a la validación, formateo y transformación de documentos XML</title>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">

                <!-- Header -->
		<header id="header">
			<div class="inner">
				<a href="#" class="logo">Game Pass videogame catalog</a>
				<nav id="nav">
					<a href="#">Home page</a>
					<a href="web/catalogo_1.html">Videogame catalog</a>
					<a href="web/catalogo_2.html">Service catalog</a>
					<a href="web/contacto.html">Contact</a>								
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
					<p>Videogame list</p>
				</header>

				<xsl:variable name="disc">
					<xsl:value-of select="//discount"/>
				</xsl:variable>

                <xsl:element name="table">
                    <xsl:element name="tr">
						<xsl:element name="th">Image</xsl:element>
                        <xsl:element name="th">Game</xsl:element>
						<xsl:element name="th">Platform</xsl:element>
						<xsl:element name="th">Price</xsl:element>
						<xsl:element name="th">Price (discount with Game Pass)</xsl:element>
						<xsl:element name="th">Date released</xsl:element>
						<xsl:element name="th">Developer</xsl:element>
						<xsl:element name="th">Publisher</xsl:element>
                    </xsl:element>
					<xsl:for-each select="//game">
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
							<xsl:element name="td"><xsl:value-of select="platform"/></xsl:element>

							<!-- Condition when a game is free -->
							<xsl:choose>
								<xsl:when test="price > 0">
									<xsl:element name="td"><xsl:value-of select="concat($price, price/@currency)"/></xsl:element>
									<xsl:element name="td"><xsl:value-of select="concat(format-number(($price * $disc),'#.##'), price/@currency)"/></xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="td"><xsl:value-of select="$price"/></xsl:element>
									<xsl:element name="td"><xsl:value-of select="$price"/></xsl:element>									
								</xsl:otherwise>
							</xsl:choose>

							<xsl:element name="td"><xsl:value-of select="release"/></xsl:element>
							<xsl:element name="td"><xsl:value-of select="dev"/></xsl:element>
							<xsl:element name="td"><xsl:value-of select="publisher"/></xsl:element>
						</xsl:element>
					</xsl:for-each>
                </xsl:element>

            </xsl:element>

        </xsl:element>
		

		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<div class="copyright">
					2021-2022 Aritz Velasco, Izan Jabón, Michal Michajlowski
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon fa-tumblr"><span class="label">Tumblr</span></a></li>
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
