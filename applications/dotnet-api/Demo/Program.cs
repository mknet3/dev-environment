using OpenTelemetry.Metrics;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddOpenTelemetryMetrics(meterProviderBuilder =>
{
    meterProviderBuilder.AddPrometheusExporter();
});

var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.UseOpenTelemetryPrometheusScrapingEndpoint();

app.Run();