<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:key name="firstname-search" match="student" use="firstname"/>
  <xsl:template match="/">
    <html>
      <body>
        <h2>Show all Students</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th style="text-align:left">Roll Number</th>
            <th style="text-align:left">First Name</th>
            <th style="text-align:left">Last Name</th>
            <th style="text-align:left">Nick Name</th>
            <th style="text-align:left">Marks</th>
            <th style="text-align:left">Gender</th>         
          </tr>
          <xsl:for-each select="class/student">
            <tr>
              <td>
                <xsl:value-of select="@rollno"/>
              </td>
              <td>
                <xsl:value-of select="firstname"/>
              </td>
              <td>
                <xsl:value-of select="lastname"/>
              </td>
              <td>
                <xsl:value-of select="nickname"/>
              </td>
              <td>
                <xsl:value-of select="marks"/>
              </td>
              <td>
                <xsl:value-of select="gender"/>
              </td>             
            </tr>
          </xsl:for-each>
        </table>              
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
