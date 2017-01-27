ActionMailer::Base.smtp_settings = {
    user_name: 'SMTP_Injection',
    password: '44f798ab0bbb2df9c8eec07ff6ac775ea32c8dbd',
    address: 'smtp.sparkpostmail.com',
    port: 587,
    enable_starttls_auto: true,
    format: :html,
    from: 'admin@adamenko.pp.ua'}
