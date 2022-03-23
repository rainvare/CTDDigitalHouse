<html>
<head>
<title>UsuarioJuego.java</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.s0 { color: #cc7832;}
.s1 { color: #a9b7c6;}
.s2 { color: #6897bb;}
.s3 { color: #6a8759;}
</style>
</head>
<body bgcolor="#2b2b2b">
<table CELLSPACING=0 CELLPADDING=5 COLS=1 WIDTH="100%" BGCOLOR="#606060" >
<tr><td><center>
<font face="Arial, Helvetica" color="#000000">
UsuarioJuego.java</font>
</center></td></tr></table>
<pre><span class="s0">package </span><span class="s1">com.company</span><span class="s0">;</span>

<span class="s0">public class </span><span class="s1">UsuarioJuego {</span>
    <span class="s0">private </span><span class="s1">String nombre</span><span class="s0">;</span>
    <span class="s0">private </span><span class="s1">String clave</span><span class="s0">;</span>
    <span class="s0">private </span><span class="s1">Integer puntaje</span><span class="s0">;</span>
    <span class="s0">private </span><span class="s1">Integer nivel</span><span class="s0">;</span>

    <span class="s0">public </span><span class="s1">UsuarioJuego(String nombre</span><span class="s0">, </span><span class="s1">String clave) {</span>
        <span class="s0">this</span><span class="s1">.nombre = nombre</span><span class="s0">;</span>
        <span class="s0">this</span><span class="s1">.clave = clave</span><span class="s0">;</span>
        <span class="s0">this</span><span class="s1">.puntaje = </span><span class="s2">0</span><span class="s0">;</span>
        <span class="s0">this</span><span class="s1">.nivel = </span><span class="s2">0</span><span class="s0">;</span>
    <span class="s1">}</span>

    <span class="s0">public void </span><span class="s1">aumentarPuntaje(){</span>
        <span class="s0">this</span><span class="s1">.puntaje ++</span><span class="s0">;</span>
        <span class="s1">System.out.println(</span><span class="s3">&quot;el puntaje es: &quot; </span><span class="s1">+ puntaje)</span><span class="s0">;</span>
    <span class="s1">}</span>
    <span class="s0">public void </span><span class="s1">aumentarNivel(){</span>
        <span class="s0">this</span><span class="s1">.nivel ++</span><span class="s0">;</span>
        <span class="s1">System.out.println(</span><span class="s3">&quot;el nivel es: &quot; </span><span class="s1">+ puntaje)</span><span class="s0">;</span>
    <span class="s1">}</span>

    <span class="s0">public void </span><span class="s1">bonus(){</span>
        <span class="s0">this</span><span class="s1">.puntaje ++</span><span class="s0">;</span>
        <span class="s1">System.out.println(</span><span class="s3">&quot;el bonus es: &quot; </span><span class="s1">+ puntaje)</span><span class="s0">;</span>
    <span class="s1">}</span>
<span class="s1">}</span>

</pre>
</body>
</html>