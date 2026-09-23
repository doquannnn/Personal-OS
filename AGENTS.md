# Repository working guidelines

## Architecture and portability

- Prefer general, portable designs that can move between AI models and platforms.
- Keep domain logic independent of model providers and platform-specific APIs.
- Isolate provider-specific behavior behind small, stable interfaces or adapters.
- Avoid premature abstraction; introduce portability boundaries where variation is likely or provider coupling would otherwise spread.
- When proposing a design, briefly state its portability trade-offs and migration path.

## Documentation

- Keep documentation concise, simple, and practical.
- Use plain language, short examples, and only the details needed to understand or use the system.
- Avoid repetition, unnecessary background, and explanations of behavior that is already obvious from the code.
- Keep documentation aligned with the current implementation.
