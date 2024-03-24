using lib;
using lib.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Twilio;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
},ServiceLifetime.Transient);

builder.Services.AddTransient<TaiKhoanService>();
builder.Services.AddTransient<TaiXeService>();
builder.Services.AddTransient<ThongTinChuyenService>();
builder.Services.AddTransient<PictureService>();
builder.Services.AddTransient<ChiTietDatChuyenService>();
builder.Services.AddTransient<DatChuyenService>();

builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>() // (Nếu bạn đang sử dụng Entity Framework)
    .AddDefaultTokenProviders();

builder.Services.AddScoped<UserManager<IdentityUser>>();
builder.Services.AddHttpClient();

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
