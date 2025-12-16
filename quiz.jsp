<%@ page import="java.util.Random" %>
<%
    Random rand = new Random();
    int numQuestions = 5; // number of quiz questions
    int[] num1 = new int[numQuestions];
    int[] num2 = new int[numQuestions];

    for (int i = 0; i < numQuestions; i++) {
        num1[i] = rand.nextInt(10); // random number 0–9
        num2[i] = rand.nextInt(10);
    }

    // Save numbers in session so they can be checked later
    session.setAttribute("num1", num1);
    session.setAttribute("num2", num2);
%>
<html>
<head><title>Addition Quiz</title></head>
<body>
    <h2>Addition Quiz</h2>
    <form action="result.jsp" method="post">
        <%
            for (int i = 0; i < numQuestions; i++) {
        %>
            <%= num1[i] %> + <%= num2[i] %> =
            <input type="text" name="answer<%= i %>"><br><br>
        <%
            }
        %>
        <input type="submit" value="Submit Answers">
    </form>
</body>
</html>
