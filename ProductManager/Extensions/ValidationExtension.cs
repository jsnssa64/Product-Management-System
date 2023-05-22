﻿using FluentValidation;
using Microsoft.AspNetCore.Mvc;

namespace ProductManager.Extensions
{
    public static class ValidationExtension
    {
        public static ValidationProblemDetails ToProblemDetails(this ValidationException ex)
        {
            var error = new ValidationProblemDetails()
            {
                Status = 400
            };

            foreach (var validationFailure in ex.Errors)
            {
                if (error.Errors.ContainsKey(validationFailure.PropertyName))
                {
                    error.Errors[validationFailure.PropertyName] =
                        error.Errors[validationFailure.PropertyName].Concat(new[]
                        {
                            validationFailure.ErrorMessage
                        }).ToArray();
                    continue;
                }

                error.Errors.Add(new KeyValuePair<string, string[]>(validationFailure.PropertyName, 
                    new[] {validationFailure.ErrorMessage}));

            }

            return error;
        }
    }
}
