using ProductManager.DTO.Product;
using ProductManager.Models.Product;
using ProductManager.DTO.Product.Type;
using ProductManager.Models.ValueObject;
using ProductManager.Response.Product;
using ProductManager.Result.Product;
using ProductManager.Data;
using ProductManager.DTO.Pagination;

namespace ProductManager.Mapper
{
    public static class Mapper
    {
        public static Product ToProduct(this CreateProductDto createProduct)
        {
            return new Product()
            {
                Id = new Guid(),
                Title = createProduct.Title,
                Description = createProduct.Description,
                Types = createProduct.Types,
                Unit = createProduct.Unit,
                WeightInfo = createProduct.WeightInfo
            };
        }

        public static ProductTypeResponse ToResponse(this ProductTypeDto productType)
        {
            return new ProductTypeResponse()
            {
                Name = productType.Name
            };
        }

        public static ProductType ToProductType(this ProductTypeDto dto)
        {
            return new ProductType()
            {
                Name = dto.Name
            };
        }
        
        public static Paging ToPaging(this PaginationDTO? dto)
        {
            return (dto == null)
                ? new Paging()
                : new Paging()
                {
                    CurrentPage = dto.Page,
                    MaxItemsPerPage = dto.MaxItemsPerPage
                };
        }

        public static Product ToProduct(this ProductDetailsDto dto)
        {
            return new Product()
            {
                Id = dto.Id,
                DiscontinuedAt = dto.DiscontinuedAt,
                Cost = new Cost(dto.Cost.Price, dto.Cost.Currency),
                Description = dto.Description,
                Title = dto.Title,
                WeightInfo = new WeightInfo(dto.WeightInfo.Weight, dto.WeightInfo.Type),
                Unit = new Unit(dto.Unit.Units, dto.Unit.UnitName),
                Types = dto.Types.Select(pt => pt.ToProductType())
            };
        }

        public static ProductDetailsResponse ToResponse(this ProductDetailsDto dto)
        {
            return new ProductDetailsResponse()
            {
                Cost = dto.Cost,
                Description = dto.Description,
                Title = dto.Title,
                WeightInfo = dto.WeightInfo,
                Types = dto.Types.Select(x => x.ToResponse())
            };
        }


        
        public static Product ToProduct(this UpdateProductDto dto, Product updateProduct)
        {
            return new Product()
            {
                Id = updateProduct.Id,
                Cost = dto.Cost == null ? updateProduct.Cost :  new Cost(dto.Cost.Price, dto.Cost.Currency),
                Description = dto.Description ?? updateProduct.Description,
                Title = dto.Title ?? updateProduct.Title,
                WeightInfo = dto.WeightInfo == null ? updateProduct.WeightInfo : new WeightInfo(dto.WeightInfo.Weight, dto.WeightInfo.Type),
                Types = dto.Types == null ? updateProduct.Types : dto.Types.Select(t => new ProductType(){ Name = t.Name}),
                Unit = dto.Unit == null ? updateProduct.Unit : new Unit(dto.Unit.Units, dto.Unit.UnitName)
            };
        }
        
        public static ProductType ToType(this ProductTypeDto dto)
        {
            return  new ProductType()
            {
                Name = dto.Name
            };
        }

        public static ProductTypeResponse ToResponse(this ProductType dto)
        {
            return new ProductTypeResponse()
            {
                Name =  dto.Name
            };
        }

        public static GetAllProductResponse ToResponse(this AllProductsDto dto, Paging pagination)
        {
            return new GetAllProductResponse(dto.Products.Select(p => p.ToResponse()), pagination);
        }

        public static ProductBasicResponse ToResponse(this BasicProductDto basicProductDto)
        {
            return new ProductBasicResponse()
            {
                Id = basicProductDto.Id,
                Description = basicProductDto.Description,
                Title = basicProductDto.Title
            };
        }

        public static ProductDetailsResponse ToResponse(this Product product)
        {
            return new ProductDetailsResponse()
            {
                Cost = product.Cost,
                Description = product.Description,
                Title = product.Title,
                WeightInfo = product.WeightInfo,
                Types = product.Types.Select(x => x.ToResponse()),
                DiscontinuedAt = product.DiscontinuedAt,
                Unit = product.Unit
            };
        }

        public static Product ToProduct(this BasicProductDto dto)
        {
            return new Product()
            {
                Id = dto.Id,
                Description = dto.Description,
                Title = dto.Title
            };
        }
    }
}
