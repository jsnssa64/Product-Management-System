namespace ProductManager.Data
{
    public abstract class DataEntity
    {
        protected abstract List<string> Fields { get; set; }

        public Dictionary<string, object> Get()
        {
            var dictionary = new Dictionary<string, object>();
            foreach (var field in Fields)
            {
                var property = this.GetType().GetProperty(field);
                var value = property?.GetValue(this, null);
                if (value != null)
                    dictionary.Add(field, value);
                else
                    throw new Exception("Property failed to be retrieved");
            }
            return dictionary;
        }
    }
}
