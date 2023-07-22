namespace ProductManagement.Data
{
    public static class DeploymentNamespaces
    {
        public static string PreDeployment { get; set; } = "PreDeployment";
        public static string PostDeployment { get; set; } = "PostDeployment";
        public static string AlwaysRun { get; set; } = "AlwaysRun";
        public static string Migrations { get; set; } = "Migrations";
    }
}
