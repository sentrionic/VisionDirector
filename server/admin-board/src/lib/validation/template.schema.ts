import * as yup from "yup";

export const TemplateSchema = yup.object().shape({
  name: yup.string().required("Name is required").defined(),
});

export const TemplateStepSchema = yup.object().shape({
  name: yup.string().required("Name is required").defined(),
  description: yup.string().max(500, `Max Limit is 500 characters`),
});
