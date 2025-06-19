<html>
<body style="font-family:Arial; background:#f0f0f0; display:flex; justify-content:center; align-items:center; height:100vh;">
    <div style="background:white; padding:25px; border-radius:10px; box-shadow:0 0 10px #999; width:400px;">
        <h2 style="text-align:center;">Submit Complaint</h2>
        <form action="/complaint" method="post">
            <label>Title</label><br/>
            <input type="text" name="title" style="width:100%; padding:8px; margin:8px 0;"/><br/>
            <label>Description</label><br/>
            <textarea name="description" style="width:100%; padding:8px; margin:8px 0;"></textarea><br/>
            <input type="hidden" name="action" value="add"/>
            <input type="submit" value="Submit" style="width:100%; padding:10px; background:#007BFF; color:white; border:none; border-radius:5px;"/>
        </form>
    </div>
</body>
</html>
