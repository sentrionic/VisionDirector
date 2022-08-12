import { Media } from "./MediaResponse";

export interface Step {
  id: string;
  name: string;
  createdAt: string;
  updatedAt: string;
  annotation?: string;
  duration?: number;
  position?: number;
  media?: Media;
  audio?: Media;
}
