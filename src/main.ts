import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const port = process.env.PORT || 6000;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors();
  await app.listen(port, '0.0.0.0');
}

bootstrap()
  .catch((error) => console.error(error))
  .then(() => console.log(`Listening on http://localhost:${port}`));
