import {
  Button,
  chakra,
  FormControl,
  FormLabel,
  HTMLChakraProps,
  IconButton,
  Input,
  InputGroup,
  InputRightElement,
  Stack,
} from '@chakra-ui/react';
import * as React from 'react';
import { HiEyeOff, HiEye } from 'react-icons/hi';
import { useNavigate } from 'react-router-dom';
import { login } from '../lib/api/axios';
import { userStore } from '../lib/userStore';

export const LoginForm = (props: HTMLChakraProps<'form'>) => {
  const [showPassword, setShowPassword] = React.useState(false);
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const navigate = useNavigate();
  const setValues = userStore((state) => state.setValues);

  return (
    <chakra.form
      onSubmit={async (e) => {
        e.preventDefault();

        try {
          const { data } = await login({ email, password });
          window.sessionStorage.setItem('jwt', data.token);
          setValues({ ...data });
          navigate('/dashboard');
        } catch (err) {
          console.log(err);
        }
      }}
      {...props}
    >
      <Stack spacing="6">
        <FormControl id="email">
          <FormLabel>Email</FormLabel>
          <Input
            name="email"
            type="email"
            autoComplete="email"
            required
            onChange={(event) => setEmail(event.currentTarget.value)}
          />
        </FormControl>
        <FormControl id="password">
          <FormLabel>Password</FormLabel>
          <InputGroup>
            <Input
              name="password"
              type={showPassword ? 'text' : 'password'}
              autoComplete="current-password"
              required
              onChange={(event) => setPassword(event.currentTarget.value)}
            />
            <InputRightElement>
              <IconButton
                bg="transparent !important"
                variant="ghost"
                aria-label={showPassword ? 'Mask password' : 'Reveal password'}
                icon={showPassword ? <HiEyeOff /> : <HiEye />}
                onClick={() => setShowPassword(!showPassword)}
              />
            </InputRightElement>
          </InputGroup>
        </FormControl>
        <Button type="submit" colorScheme="blue" size="lg" fontSize="md">
          Login
        </Button>
      </Stack>
    </chakra.form>
  );
};
