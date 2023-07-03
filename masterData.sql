USE [PartialZ]
GO
SET IDENTITY_INSERT [dbo].[EmailTemplates] ON 

INSERT [dbo].[EmailTemplates] ([ID], [Template], [Subject], [Description], [IsActive], [CreatedDate], [LastModifedDate]) VALUES (1, N'<!DOCTYPE html>
<html>
<head>
    <title>Email Verification</title>
</head>
<body>
    <h2>Email Verification</h2>
    <p>Dear member,</p>
    <p>Thank you for registering. Please click the button below to verify your email address:</p>
    
    <a href="$$VERIFICATION_URL$$" target="_blank" style="display:inline-block;background-color:#6600cc;color:#ffffff;padding:10px 20px;text-decoration:none;border-radius:4px;">Verify Email</a>
    
    <p>If the button doesn''t work, you can also copy and paste the following URL into your browser:</p>
    <p>$$VERIFICATION_URL$$</p>
    
    <p>If you didn''t register on our website, you can ignore this email.</p>
    
    <p>Thank you,<br>PartialZ Team</p>
</body>
</html>', N'Important: Verify your email to access your account', N'Important: Verify your email to access your account', 1, CAST(N'2023-07-02T11:48:41.573' AS DateTime), CAST(N'2023-07-02T11:48:41.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmailTemplates] OFF
GO
