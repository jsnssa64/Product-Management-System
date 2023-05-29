namespace ProductManager.Response.Product
{
    public record ProductBasicResponse {
        public Guid Id { get; set; }
        public string Title { get; set; } 
        public string Description { get; set; }

    };
}
