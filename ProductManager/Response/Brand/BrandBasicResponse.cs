﻿namespace ProductManager.Response.Brand
{
    public class BrandBasicResponse
    {
        public BrandBasicResponse(Guid id, string title, string description)
        {
            Id = id;
            Title = title;
            Description = description;
        }

        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }

    }
}
