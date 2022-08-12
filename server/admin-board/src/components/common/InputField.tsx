import React, { InputHTMLAttributes } from "react";
import { useField } from "formik";
import {
  FormControl,
  FormErrorMessage,
  FormLabel,
  Input,
  Textarea,
} from "@chakra-ui/react";

type InputFieldProps = InputHTMLAttributes<HTMLInputElement> & {
  label: string;
  name: string;
  textarea?: boolean;
};

export const InputField: React.FC<InputFieldProps> = ({
  label,
  textarea,
  ...props
}) => {
  const [field, { error, touched }] = useField(props);

  let InputOrTextarea: any = Input;
  if (textarea) {
    InputOrTextarea = Textarea;
  }

  return (
    <FormControl mt={4} isInvalid={error != null && touched}>
      <FormLabel>{label}</FormLabel>
      {/* @ts-ignore */}
      <InputOrTextarea {...field} {...props} />
      <FormErrorMessage>{error}</FormErrorMessage>
    </FormControl>
  );
};
