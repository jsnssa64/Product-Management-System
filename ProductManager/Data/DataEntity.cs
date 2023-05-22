namespace ProductManager.Data
{
    public abstract class DataEntity
    {
        public readonly List<string> Fields = new();

        protected DataEntity()
        {
            Fields.Add("LastModifiedAt");
            Fields.Add("CreatedAt");
        }

        public DateTime CreatedAt { get; set; }
        public DateTime LastModifiedAt { get; set; } = DateTime.UtcNow;

        public Dictionary<string, object> GetKeyValuePair()
        {
            var dictionary = new Dictionary<string, object>();
            foreach (var field in Fields)
            {
                var property = GetType().GetProperty(field);
                var value = property?.GetValue(this, null);
                if (value != null)
                    dictionary.Add(field, value);
                else
                    throw new Exception("Property failed to be retrieved");
            }
            return dictionary;
        }

        protected abstract void AddFields();
    }
}
