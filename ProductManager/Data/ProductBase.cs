namespace ProductManager.Data
{
    public abstract class ProductBase : Base
    {
        protected ProductBase(Guid id)
        {
            Id = id;
        }
        public Guid Id { get; }
        private bool Discontinued { get; set; } = false;
        private DateTime? DiscontinuedAt { get; set; } = null;

        public virtual void Discontinue()
        {
            if (DiscontinuedAt != null || !Discontinued)
            {
                //  Already has been discontinued
                return;
            }

            this.Discontinued = true;
            this.DiscontinuedAt = DateTime.UtcNow;
        }
    }
}
