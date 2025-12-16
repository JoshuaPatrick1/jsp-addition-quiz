<%@ page import="java.util.*" %>
<%
    int[] num1 = (int[]) session.getAttribute("num1");
    int[] num2 = (int[]) session.getAttribute("num2");
    int numQuestions = num1.length;

    int correctCount = 0;
%>
<html>
<head><title>Quiz Results</title></head>
<body>
    <h2>Quiz Results</h2>
    <%
        for (int i = 0; i < numQuestions; i++) {
            int correctAnswer = num1[i] + num2[i];
            int userAnswer = Integer.parseInt(request.getParameter("answer" + i));

            if (userAnswer == correctAnswer) {
                correctCount++;
                out.println(num1[i] + " + " + num2[i] + " = " + userAnswer + " ✔ Correct<br>");
            } else {
                out.println(num1[i] + " + " + num2[i] + " = " + userAnswer +
                            " ✘ Wrong (Correct: " + correctAnswer + ")<br>");
            }
        }
    %>
    <p><b>You got <%= correctCount %> out of <%= numQuestions %> correct.</b></p>
</body>
</html>
