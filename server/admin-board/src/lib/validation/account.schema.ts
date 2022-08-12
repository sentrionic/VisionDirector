import * as yup from 'yup';

export const LoginSchema = yup.object().shape({
  email: yup.string().required('Email is required').defined(),
  password: yup.string().required('Password is required').defined(),
});

export const RegisterSchema = yup.object().shape({
  username: yup
    .string()
    .min(3)
    .max(30)
    .trim()
    .required('Username is required')
    .defined(),
  email: yup
    .string()
    .email()
    .lowercase()
    .required('Email is required')
    .defined(),
  password: yup
    .string()
    .min(6, 'Password must be at least 6 characters long')
    .max(150)
    .required('Password is required')
    .defined(),
});
