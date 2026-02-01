using PCM.Api.Services;

var builder = WebApplication.CreateBuilder(args);

// 🔥 BẮT BUỘC: lắng nghe tất cả IP
builder.WebHost.UseUrls("http://0.0.0.0:5003");

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        policy =>
        {
            policy.AllowAnyOrigin()
                  .AllowAnyMethod()
                  .AllowAnyHeader();
        });
});

builder.Services.AddSingleton<WalletService>();
builder.Services.AddSingleton<BookingService>();
builder.Services.AddSingleton<MatchService>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.UseCors("AllowAll");

app.MapControllers();
app.Run();
