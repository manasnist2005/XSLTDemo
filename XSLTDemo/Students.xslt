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
              <th style="text-align:left">SpecialId</th>
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
                <td>
                  <xsl:value-of select="firstname/@specialId"/>
                </td>
              </tr>              
            </xsl:for-each>
          </table>
          <h2>Sort by firstname</h2>
          <table border="1">
            <tr bgcolor="#238dc0">
              <th style="text-align:left">Roll Number</th>
              <th style="text-align:left">First Name</th>
              <th style="text-align:left">Last Name</th>
              <th style="text-align:left">Nick Name</th>
              <th style="text-align:left">Marks</th>
              <th style="text-align:left">Gender</th>
             
            </tr>
            <xsl:for-each select="class/student">
              <xsl:sort select="firstname"/>
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
          <h2>If condition [Get all students whise mark is above 87]</h2>
          <table border="1">
            <tr bgcolor="#4e37da">
              <th style="text-align:left">Roll Number</th>
              <th style="text-align:left">First Name</th>
              <th style="text-align:left">Last Name</th>
              <th style="text-align:left">Nick Name</th>
              <th style="text-align:left">Marks</th>
              <th style="text-align:left">Gender</th>
              
            </tr>
            <xsl:for-each select="class/student">
              <xsl:if test="marks > 87">
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
              </xsl:if>
            </xsl:for-each>
          </table>
          <h2>XSL Choose statement in Marks column</h2>
          <table border="1">
            <tr bgcolor="#7a19e0">
              <th style="text-align:left">Roll Number</th>
              <th style="text-align:left">First Name</th>
              <th style="text-align:left">Last Name</th>
              <th style="text-align:left">Nick Name</th>
              <th style="text-align:left">Marks</th>
              <th style="text-align:left">Gender</th>

            </tr>
            <xsl:for-each select="class/student">
              <xsl:sort select="marks" order="ascending"/>
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
                    <xsl:choose>
                      <xsl:when test="marks > 89">
                        High
                      </xsl:when>
                      <xsl:when test="marks > 75">
                        Medium
                      </xsl:when>
                      <xsl:otherwise>
                        Low
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:value-of select="gender"/>
                  </td>
                </tr>             
            </xsl:for-each>
          </table>
          <h2>XSL Key : firstname-search matches with 'Manoj'</h2>
          <table border="1">
            <tr bgcolor="#7a19e0">
              <th style="text-align:left">Roll Number</th>
              <th style="text-align:left">First Name</th>
              <th style="text-align:left">Last Name</th>
              <th style="text-align:left">Nick Name</th>
              <th style="text-align:left">Marks</th>
              <th style="text-align:left">Gender</th>
            </tr>            
            <xsl:for-each  select="key('firstname-search', 'Manoj')">
             
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
          <h2>XSL Meassage:: If the firstname is empty :: No further rows displayed from empty firstname</h2>
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
              <xsl:if test="firstname=''">
                  <xsl:message terminate="yes">A first name field is empty.</xsl:message>
              </xsl:if>
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
